import 'package:contactless_payment_app/domain/model/user_and_token.dart';
import 'package:equatable/equatable.dart';

enum AppStatus {
  appStarted,
  authenticated,
  unauthenticated,
}

class AppState extends Equatable {
  const AppState._({
    required this.status,
  });

  final AppStatus status;

  const AppState.authenticated() : this._(status: AppStatus.authenticated);

  const AppState.unauthenticated() : this._(status: AppStatus.unauthenticated);

  const AppState.appStarted() : this._(status: AppStatus.appStarted);

  @override
  List<Object> get props => [status];
}
