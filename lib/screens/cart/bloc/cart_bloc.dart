import 'package:contactless_payment_app/data/exception/remote_data_source_exception.dart';
import 'package:contactless_payment_app/data/local/entities/mappers.dart';
import 'package:contactless_payment_app/domain/repositories/user_repository.dart';
import 'package:contactless_payment_app/screens/cart/bloc/cart_event.dart';
import 'package:contactless_payment_app/screens/cart/bloc/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(const CartState()) {
    on<CartItemEvent>(_onCartItem);
  }

  final UserRepository _userRepository;

  void _onCartItem(CartItemEvent event, Emitter<CartState> emit) async {
    emit(state.copyWith(
      isLoading: () => true,
    ));
    try {
      final user = await _userRepository.userAndToken;
      final cartItemResponse =
          await _userRepository.cartItems(token: user!.token);
      final cartItems = Mappers.cartItemResponseToModel(cartItemResponse);
      emit(state.copyWith(
          isLoading: () => false, cartItems: () => cartItems.toList()));
    } on RemoteDataSourceException catch (e) {
      emit(state.copyWith(isLoading: () => false));
    }
  }

  int getTotalPrice() {
    int sum = 0;
    for (var item in state.cartItems) {
      sum += item.productPrice * item.productQty;
    }
    return sum;
  }
}
