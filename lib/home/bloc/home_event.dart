part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}


class HomeLoadEvent extends HomeEvent{
  @override
  List<Object?> get props =>[];
}

class HomeCountChangeEvent extends HomeEvent{
  final int count;
  final productId;
  HomeCountChangeEvent(this.count,this.productId);
  @override
  List<Object?> get props =>[count,productId];
}
