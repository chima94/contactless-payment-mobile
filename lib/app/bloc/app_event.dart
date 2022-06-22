import 'package:contactless_payment_app/data/local/entities/user_and_token_entity.dart';
import 'package:contactless_payment_app/domain/model/user_and_token.dart';
import 'package:equatable/equatable.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

class AppLogoutRequested extends AppEvent {}

class AppStartedEvent extends AppEvent {
  const AppStartedEvent({this.token = ''});
  final String token;
}

class AppUserChanged extends AppEvent {
  final UserAndTokenEntity? user;
  const AppUserChanged(this.user);

  @override
  List<Object> get props => [];
}
