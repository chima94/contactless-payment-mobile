import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class AddToCartEvent extends HomeEvent {
  final String productId;
  const AddToCartEvent({required this.productId});
}