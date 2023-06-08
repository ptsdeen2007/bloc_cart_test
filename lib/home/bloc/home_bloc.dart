import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cart_task/core/data/app_const.dart';
import 'package:equatable/equatable.dart';

import '../../core/data/DataStore.dart';
import '../../core/models/Product.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeLoading()) {
    on<HomeEvent>((event, emit) {
      var selectedProducts =
      DataStore.instance.products.where((element) => element.qty > 0).toList();

      emit(HomeLoaded(products: DataStore.instance.products,cartItems: selectedProducts));
    });

    on<HomeCountChangeEvent>((event, emit) {
      var product = DataStore.instance.products
          .firstWhere((element) => element.productId == event.productId);
      product.qty = event.count;

      var selectedProducts =
      DataStore.instance.products.where((element) => element.qty > 0).toList();
      emit(HomeLoaded(products: DataStore.instance.products,cartItems: selectedProducts));
    });
  }
}
