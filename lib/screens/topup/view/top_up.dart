import 'package:contactless_payment_app/screens/home/view/widgets/title_text.dart';
import 'package:contactless_payment_app/screens/topup/bloc/top_up_bloc.dart';
import 'package:contactless_payment_app/screens/topup/bloc/top_up_event.dart';
import 'package:contactless_payment_app/screens/topup/bloc/top_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopUpPage extends StatelessWidget {
  const TopUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TopUpBloc(),
      child: const TopUpView(),
    );
  }
}

class TopUpView extends StatelessWidget {
  const TopUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade900,
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Expanded(
                    flex: 1,
                    child: SizedBox(),
                  ),
                  Text(
                    "Top My Wallet",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  _AmountDisplay(),
                  Expanded(
                    flex: 2,
                    child: SizedBox(),
                  ),
                ],
              ),
            ),
            Positioned(
              left: -140,
              top: -270,
              child: CircleAvatar(
                radius: 190,
                backgroundColor: Colors.blue.shade300,
              ),
            ),
            Positioned(
              left: -130,
              top: -300,
              child: CircleAvatar(
                radius: 190,
                backgroundColor: Colors.blue.shade500,
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * .4,
              right: -150,
              child: CircleAvatar(
                radius: 130,
                backgroundColor: Colors.yellow.shade600,
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * .4,
              right: -180,
              child: CircleAvatar(
                radius: 130,
                backgroundColor: Colors.yellow.shade400,
              ),
            ),
            Positioned(
              left: 0,
              top: 40,
              child: Row(
                children: const [
                  BackButton(
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  TittleText(
                    text: 'Top Up',
                    color: Colors.white,
                  )
                ],
              ),
            ),
            const _ButtonWidget()
          ],
        ),
      ),
    );
  }
}

class _AmountDisplay extends StatelessWidget {
  const _AmountDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopUpBloc, TopUpState>(builder: (context, state) {
      final amount = state.text.isEmpty ? '0.0' : state.text;
      return Container(
        width: 130,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: TittleText(
          text: amount,
          color: Colors.white,
        ),
      );
    });
  }
}

class _ButtonWidget extends StatelessWidget {
  const _ButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: MediaQuery.of(context).size.height * .54,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: Column(
          children: [
            Expanded(
                child: GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 1.5,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              children: const <Widget>[
                _CountButton(text: '1'),
                _CountButton(text: '2'),
                _CountButton(text: '3'),
                _CountButton(text: '4'),
                _CountButton(text: '5'),
                _CountButton(text: '6'),
                _CountButton(text: '7'),
                _CountButton(text: '8'),
                _CountButton(text: '9'),
                _CountButton(text: 'N'),
                _CountButton(text: '0'),
                _Icons(icon: Icons.backspace, isBackground: false)
              ],
            )),
            const _SubmitButton(),
          ],
        ),
      ),
    );
  }
}

class _CountButton extends StatelessWidget {
  const _CountButton({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          context.read<TopUpBloc>().add(TopUpKeypadEvent(text: text));
        },
        child: Container(
          alignment: Alignment.center,
          color: Colors.white,
          child: TittleText(
            text: text,
          ),
        ),
      ),
    );
  }
}

class _Icons extends StatelessWidget {
  const _Icons({
    Key? key,
    required this.icon,
    required this.isBackground,
  }) : super(key: key);
  final IconData icon;
  final bool isBackground;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: () {
          context.read<TopUpBloc>().add(const TopUpResetEvent());
        },
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: BoxDecoration(
                  color: isBackground ? Colors.grey : Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                ),
                child: Icon(icon),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<TopUpBloc>().add(const TopUpSubmitEvent());
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
          color: Colors.blue.shade900,
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: Wrap(
          children: [
            Transform.rotate(
              angle: 70,
              child: const Icon(Icons.swap_calls, color: Colors.white),
            ),
            const SizedBox(
              width: 10,
            ),
            const TittleText(
              text: 'Top Up',
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
