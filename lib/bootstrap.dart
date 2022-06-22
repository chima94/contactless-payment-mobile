import 'dart:async';
import 'dart:developer';

import 'package:contactless_payment_app/app/app_bloc_observer.dart';
import 'package:contactless_payment_app/app/view/app.dart';
import 'package:contactless_payment_app/domain/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void bootstrap(UserRepository userRepository) {
  FlutterError.onError = (details) {
    log(
      details.exceptionAsString(),
      stackTrace: details.stack,
    );
  };

  runZonedGuarded(
    () async {
      await userRepository.userAndToken$.first;
      await BlocOverrides.runZoned(
        () async => runApp(App(
          userRepository: userRepository,
        )),
        blocObserver: AppBlocObserver(),
      );
    },
    (error, stackTrace) => log(
      error.toString(),
      stackTrace: stackTrace,
    ),
  );
}
