import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  const LoginState({
    this.email = '',
    this.password = '',
    this.isLoading = false,
    this.errorMsg = '',
  });

  final String email;
  final String password;
  final bool isLoading;
  final String errorMsg;

  LoginState copyWith({
    String? email,
    String? password,
    bool? isLoading,
    String? errorMsg,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      isLoading: isLoading ?? this.isLoading,
      errorMsg: errorMsg ?? this.errorMsg,
    );
  }

  @override
  List<Object> get props => [
        email,
        password,
        isLoading,
        errorMsg,
      ];
}
