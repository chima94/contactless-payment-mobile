import 'package:contactless_payment_app/domain/model/cart_item.dart';
import 'package:equatable/equatable.dart';

class CartState extends Equatable {
  final bool isLoading;
  final List<CartItem> cartItems;
  const CartState({
    this.isLoading = false,
    this.cartItems = const [],
  });

  CartState copyWith({
    bool Function()? isLoading,
    List<CartItem> Function()? cartItems,
  }) {
    return CartState(
      isLoading: isLoading != null ? isLoading() : this.isLoading,
      cartItems: cartItems != null ? cartItems() : this.cartItems,
    );
  }

  @override
  List<Object> get props => [
        isLoading,
        cartItems,
      ];
}
