import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cart_task/core/data/app_const.dart';
import 'package:cart_task/core/models/Product.dart';
import 'package:equatable/equatable.dart';

import '../../core/data/DataStore.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoading()) {
    on<CartLoadEvent>((event, emit) {
      var selectedProducts = DataStore.instance.products.where((element) => element.qty > 0).toList();
     double totalAmount= selectedProducts.map((e) => e.totalPrice).fold(0.0, (previousValue, element) => previousValue+element);
      emit(CartLoaded(products: DataStore.instance.products,cartItems: selectedProducts,totalAmount: totalAmount));
    });

    on<CartCountChangeEvent>((event, emit) {
      var product = DataStore.instance.products
          .firstWhere((element) => element.productId == event.productId);
      product.qty = event.count;

      var selectedProducts =
      DataStore.instance.products.where((element) => element.qty > 0).toList();
      double totalAmount= selectedProducts.map((e) => e.totalPrice).fold(0.0, (previousValue, element) => previousValue+element);
      emit(CartLoaded(products: DataStore.instance.products,cartItems: selectedProducts,totalAmount: totalAmount));
    });
  }
}
