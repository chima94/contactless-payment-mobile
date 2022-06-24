import 'dart:async';
import 'package:contactless_payment_app/app/bloc/app_event.dart';
import 'package:contactless_payment_app/app/bloc/app_state.dart';
import 'package:contactless_payment_app/data/local/entities/mappers.dart';
import 'package:contactless_payment_app/data/local/entities/user_and_token_entity.dart';
import 'package:contactless_payment_app/domain/repositories/user_repository.dart';
import 'package:contactless_payment_app/utils/result.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBLoc extends Bloc<AppEvent, AppState> {
  AppBLoc({
    required UserRepository userRepository,
  })  : _userRepository = userRepository,
        super(const AppState.appStarted()) {
    on<AppStartedEvent>(_onAppStarted);
    on<AppUserChanged>(_onAppUserChanged);

    _userSubscription = _userRepository.userAndToken$.listen((user) {
      if (state.status == AppStatus.appStarted && user != null) {
        add(AppStartedEvent(token: user.token));
      } else {
        add(AppUserChanged(user));
      }
    });
  }

  final UserRepository _userRepository;
  late final StreamSubscription<UserAndTokenEntity?> _userSubscription;

  void _onAppStarted(AppStartedEvent event, Emitter<AppState> emit) async {
    try {
      final result = await _userRepository.getUserProfile(token: event.token);
      final user =
          Mappers.userResponseToUserAndTokenEntity(result, event.token);
      add(AppUserChanged(user));
    } catch (e) {
      emit(
        const AppState.unauthenticated(),
      );
    }
  }

  void _onAppUserChanged(AppUserChanged event, Emitter<AppState> emit) async {
    if (event.user != null) {
      emit(
        const AppState.authenticated(),
      );
    } else {
      emit(
        const AppState.unauthenticated(),
      );
    }
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
