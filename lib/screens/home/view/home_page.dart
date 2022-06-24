import 'package:contactless_payment_app/domain/repositories/user_repository.dart';
import 'package:contactless_payment_app/screens/cart/view/cart.dart';
import 'package:contactless_payment_app/screens/home/bloc/home_bloc.dart';
import 'package:contactless_payment_app/screens/home/bloc/home_event.dart';
import 'package:contactless_payment_app/screens/home/bloc/home_state.dart';
import 'package:contactless_payment_app/screens/home/view/widgets/balance_card.dart';
import 'package:contactless_payment_app/screens/home/view/widgets/operation_widgets.dart';
import 'package:contactless_payment_app/screens/home/view/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: HomePage());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeBloc(userRepository: context.read<UserRepository>()),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
        buildWhen: (previous, current) => previous.wallet != current.wallet,
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: TittleText(
                text: state.username,
                color: Colors.blueGrey,
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CartPage(),
                        ),
                      );
                    },
                    child: const Icon(
                      Icons.shopping_cart_checkout_rounded,
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
              ],
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              elevation: 0,
            ),
            body: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    SizedBox(
                      height: 35,
                    ),
                    BalanceCard(),
                    SizedBox(
                      height: 50,
                    ),
                    TittleText(
                      text: 'Operations',
                      color: Colors.blueGrey,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    OperationWidget(),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
