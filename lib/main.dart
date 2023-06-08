
import 'package:cart_task/cart/bloc/cart_bloc.dart';
import 'package:cart_task/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cart/view/cart_screen.dart';
import 'home/view/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
     providers: [
       BlocProvider(create:(_)=> HomeBloc()..add(HomeLoadEvent())),
       BlocProvider(create:(_)=> CartBloc())
     ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          HomeScreen.route: (_) => const HomeScreen(),
          CartScreen.route: (_) => const CartScreen(),
        },
      ),
    );
  }
}
