import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/counter_widget.dart';
import '../bloc/cart_bloc.dart';

class CartScreen extends StatelessWidget {
  static final String route = "/cart";

  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<CartBloc>().add(CartLoadEvent());
    return Scaffold(
      appBar: AppBar(title: Text("Cart")),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoading) return CupertinoActivityIndicator();
          if (state is CartLoaded)
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: state.cartItems.length,
                      itemBuilder: (context, postion) {
                        var item = state.cartItems[postion];
                        return Card(
                          key: Key(item.productId.toString()),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                        child: Column(
                                      children: [
                                        Text(item.title),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Text(item.description)
                                      ],
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                    )),
                                    CounterWidget(
                                        initialCount: item.qty,
                                        onChanged: (count) {
                                          context.read<CartBloc>().add(
                                              CartCountChangeEvent(
                                                  count, item.productId));
                                        })
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                        "${item.price.toString()} x ${item.qty}"),
                                    Text("Rs${item.totalPrice}")
                                  ],
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                ListTile(
                  title: Text("Total"),
                  trailing: Text("Rs ${state.totalAmount}"),
                )
              ],
            );
          return Container();
        },
      ),
    );
  }
}
