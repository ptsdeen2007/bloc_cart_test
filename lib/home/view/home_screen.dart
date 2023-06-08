import 'package:cart_task/cart/view/cart_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/counter_widget.dart';
import '../bloc/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  static final String route="/";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Salad & Soups"),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return CupertinoActivityIndicator();
          }
          if (state is HomeLoaded) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: state.products.length,
                      itemBuilder: (context, position) {
                        var item = state.products[position];
                        return Card(
                          key: Key(item.productId.toString()),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Expanded(child:
                                Column(
                                  children: [
                                    Text(item.title),
                                    SizedBox(height: 4,),
                                    Text(item.description)
                                  ],
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                )),
                                CounterWidget(initialCount: item.qty,onChanged: (count){
                                  context.read<HomeBloc>().add(HomeCountChangeEvent(count, item.productId));
                                })
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                Visibility(
                    visible: state.cartItems.isNotEmpty,
                    child: Row(
                  children: [
                    Icon(Icons.shopping_cart_outlined),
                     Text("${state.cartItems.length} Items"),
                    Expanded(child: Container()),
                    ElevatedButton(onPressed: () async {
                     await Navigator.pushNamed(context, CartScreen.route);
                     context.read<HomeBloc>().add(HomeLoadEvent());
                    }, child: Text("Place Order"))
                  ],
                ))
              ],
            );
          }
          return Container(
          );
        },
      ),
    );
  }
}
