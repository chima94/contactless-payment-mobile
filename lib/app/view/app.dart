import 'package:contactless_payment_app/app/bloc/app_bloc.dart';
import 'package:contactless_payment_app/app/bloc/app_event.dart';
import 'package:contactless_payment_app/app/bloc/app_state.dart';
import 'package:contactless_payment_app/app/routes/route.dart';
import 'package:contactless_payment_app/domain/repositories/user_repository.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
    required UserRepository userRepository,
  })  : _userRepository = userRepository,
        super(key: key);

  final UserRepository _userRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<UserRepository>(
          create: (context) => _userRepository,
        ),
      ],
      child: BlocProvider(
        create: (_) => AppBLoc(
          userRepository: _userRepository,
        )..add(AppStartedEvent()),
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FlowBuilder<AppStatus>(
        state: context.select((AppBLoc bloc) => bloc.state.status),
        onGeneratePages: onGenerateAppViewPages,
      ),
    );
  }
}
