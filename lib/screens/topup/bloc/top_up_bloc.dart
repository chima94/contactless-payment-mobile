import 'package:bloc/bloc.dart';
import 'package:contactless_payment_app/screens/topup/bloc/top_up_event.dart';
import 'package:contactless_payment_app/screens/topup/bloc/top_up_state.dart';

class TopUpBloc extends Bloc<TopUpEvent, TopUpState> {
  TopUpBloc() : super(TopUpState()) {
    on<TopUpKeypadEvent>(_onKeyPadClick);
    on<TopUpResetEvent>(_onReset);
    on<TopUpSubmitEvent>(_onSubmit);
  }

  void _onKeyPadClick(TopUpKeypadEvent event, Emitter<TopUpState> emit) {
    if (event.text != 'N') {
      emit(state.copyWith(text: event.text));
    }
  }

  void _onReset(TopUpResetEvent event, Emitter<TopUpState> emit) {
    emit(state.copyWith(text: ''));
  }

  void _onSubmit(TopUpSubmitEvent event, Emitter<TopUpState> emit) {
    print(state.text);
  }
}
