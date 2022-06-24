import 'dart:async';

import 'package:contactless_payment_app/data/local/entities/user_and_token_entity.dart';
import 'package:contactless_payment_app/domain/repositories/user_repository.dart';
import 'package:contactless_payment_app/screens/home/bloc/home_event.dart';
import 'package:contactless_payment_app/screens/home/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(const HomeState()) {
    on<GetUserEvent>(_getUser);

    _userSubscription = _userRepository.userAndToken$.listen((user) {
      add(GetUserEvent(user: user!));
    });
  }

  final UserRepository _userRepository;
  late final StreamSubscription<UserAndTokenEntity?> _userSubscription;

  void _getUser(GetUserEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(
        wallet: event.user.user.wallet, username: event.user.user.name));
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
