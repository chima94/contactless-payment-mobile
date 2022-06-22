import 'package:contactless_payment_app/data/exception/remote_data_source_exception.dart';
import 'package:contactless_payment_app/domain/repositories/user_repository.dart';
import 'package:contactless_payment_app/domain/usecases/login_usecase.dart';
import 'package:contactless_payment_app/screens/login/cubit/login_state.dart';
import 'package:contactless_payment_app/utils/result.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({
    required LoginUseCase loginUseCase,
  })  : _loginUseCase = loginUseCase,
        super(const LoginState());

  final LoginUseCase _loginUseCase;

  void emailChanged(String value) {
    emit(
      state.copyWith(
        email: value,
        errorMsg: '',
      ),
    );
  }

  void passwordChanged(String value) {
    emit(
      state.copyWith(
        password: value,
        errorMsg: '',
      ),
    );
  }

  void login() {
    _loginUseCase(email: state.email, password: state.password)
        .doOnListen(() {
          emit(state.copyWith(isLoading: true));
        })
        .doOnData((event) {
          emit(state.copyWith(isLoading: false));
        })
        .map((result) => {
              result.fold((value) {}, (error, message) {
                if (error == 400) {
                  emit(state.copyWith(errorMsg: message));
                } else {
                  emit(state.copyWith(errorMsg: 'Unknown error'));
                }
              })
            })
        .listen((event) {});
  }
}
