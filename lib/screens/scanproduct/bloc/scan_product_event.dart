import 'package:equatable/equatable.dart';

abstract class ScanProductEvent extends Equatable {
  const ScanProductEvent();

  @override
  List<Object> get props => [];
}

class AddToCartEvent extends ScanProductEvent {
  final String productId;
  const AddToCartEvent({required this.productId});
}
