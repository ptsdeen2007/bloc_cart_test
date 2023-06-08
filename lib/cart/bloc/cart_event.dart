part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();
}
class CartLoadEvent extends CartEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class CartCountChangeEvent extends CartEvent{
  final int count;
  final productId;
  CartCountChangeEvent(this.count,this.productId);
  @override
  List<Object?> get props =>[count,productId];
}