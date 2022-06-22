import 'package:contactless_payment_app/data/exception/remote_data_source_exception.dart';
import 'package:contactless_payment_app/domain/repositories/user_repository.dart';
import 'package:contactless_payment_app/screens/scanproduct/bloc/scan_product_event.dart';
import 'package:contactless_payment_app/screens/scanproduct/bloc/scan_product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScanProductBloc extends Bloc<ScanProductEvent, ScanProductState> {
  ScanProductBloc({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(const ScanProductState()) {
    on<AddToCartEvent>(_addToCart);
  }

  final UserRepository _userRepository;

  void _addToCart(AddToCartEvent event, Emitter<ScanProductState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      final user = await _userRepository.userAndToken;
      final response = await _userRepository.addToCart(
          token: user!.token, productId: event.productId);
      emit(state.copyWith(msg: 'Success', isLoading: false));
    } on RemoteDataSourceException catch (e) {
      emit(state.copyWith(isLoading: false, msg: e.message));
    }
  }
}
