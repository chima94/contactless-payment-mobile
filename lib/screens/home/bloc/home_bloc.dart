import 'package:contactless_payment_app/data/exception/remote_data_source_exception.dart';
import 'package:contactless_payment_app/domain/repositories/user_repository.dart';
import 'package:contactless_payment_app/screens/home/bloc/home_event.dart';
import 'package:contactless_payment_app/screens/home/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(const HomeState()) {
    //on<AddToCartEvent>(_addToCart);
  }

  final UserRepository _userRepository;
}
