part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeLoading extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeLoaded extends HomeState {
  List<Product> products;
  List<Product> cartItems;
  HomeLoaded({required this.products,required this.cartItems});

  @override
  List<Object> get props => [products,cartItems];
}


