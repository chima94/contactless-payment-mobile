import 'package:bloc/bloc.dart';
import 'package:contactless_payment_app/domain/repositories/user_repository.dart';
import 'package:contactless_payment_app/screens/topup/bloc/top_up_event.dart';
import 'package:contactless_payment_app/screens/topup/bloc/top_up_state.dart';

class TopUpBloc extends Bloc<TopUpEvent, TopUpState> {
  TopUpBloc({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(TopUpState()) {
    on<TopUpKeypadEvent>(_onKeyPadClick);
    on<TopUpResetEvent>(_onReset);
    on<TopUpSubmitEvent>(_onSubmit);
  }

  final UserRepository _userRepository;

  void _onKeyPadClick(TopUpKeypadEvent event, Emitter<TopUpState> emit) {
    if (event.text != 'N') {
      emit(state.copyWith(text: event.text));
    }
  }

  void _onReset(TopUpResetEvent event, Emitter<TopUpState> emit) {
    emit(state.copyWith(text: ''));
  }

  void _onSubmit(TopUpSubmitEvent event, Emitter<TopUpState> emit) async {
    if (state.text.isNotEmpty) {
      final amount = int.parse(state.text);
      emit(state.copyWith(text: '', isLoading: true));
      try {
        final user = await _userRepository.userAndToken;
        final result = await _userRepository.topupWallet(
            amount: amount, token: user!.token);
        emit(state.copyWith(text: '', isLoading: false, msg: 'Wallet Funded'));
      } catch (e) {
        emit(state.copyWith(
            text: '', isLoading: false, msg: 'Try again, somethin went wrong'));
      }
    }
  }
}
