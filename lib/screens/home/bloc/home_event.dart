import 'package:contactless_payment_app/data/local/entities/user_and_token_entity.dart';
import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class GetUserEvent extends HomeEvent {
  UserAndTokenEntity user;
  GetUserEvent({required this.user});
}
