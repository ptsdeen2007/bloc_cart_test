part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();
}

class CartLoading extends CartState {
  @override
  List<Object> get props => [];
}

class CartLoaded extends CartState {
  List<Product> products;
  List<Product> cartItems;
  double totalAmount;
  CartLoaded({required this.products,required this.cartItems,required this.totalAmount});

  @override
  List<Object> get props => [products,cartItems,totalAmount];
}