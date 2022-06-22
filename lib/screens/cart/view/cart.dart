import 'package:contactless_payment_app/domain/model/cart_item.dart';
import 'package:contactless_payment_app/domain/repositories/user_repository.dart';
import 'package:contactless_payment_app/screens/cart/bloc/cart_bloc.dart';
import 'package:contactless_payment_app/screens/cart/bloc/cart_event.dart';
import 'package:contactless_payment_app/screens/cart/bloc/cart_state.dart';
import 'package:contactless_payment_app/screens/delete/view/delete_item.dart';
import 'package:contactless_payment_app/screens/home/view/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const TittleText(
          text: 'My Cart',
          color: Colors.blueGrey,
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        iconTheme: const IconThemeData(color: Colors.blueGrey),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        child: BlocProvider(
          create: (_) =>
              CartBloc(userRepository: context.read<UserRepository>())
                ..add(CartItemEvent()),
          child: const CartView(),
        ),
      ),
    );
  }
}

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(builder: (context, state) {
      if (state.isLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (!state.isLoading && state.cartItems.isEmpty) {
        return const Center(child: Text('No item'));
      } else {
        return Column(
          children: [
            _Subtitle(
              total: state.cartItems.length.toString(),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: state.cartItems.length,
                  itemBuilder: (_, index) {
                    final cartItem = state.cartItems[index];
                    return _CartItemTiles(
                      cartItem: cartItem,
                    );
                  }),
            ),
            const _Footer(),
          ],
        );
      }
    });
  }
}

class _CartItemTiles extends StatelessWidget {
  const _CartItemTiles({Key? key, required this.cartItem}) : super(key: key);
  final CartItem cartItem;

  @override
  Widget build(BuildContext context) {
    final itemPrice = cartItem.productPrice * cartItem.productQty;
    return Stack(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(right: 16, top: 16),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(16))),
          child: Row(
            children: [
              Container(
                margin:
                    const EdgeInsets.only(right: 8, left: 8, top: 8, bottom: 8),
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(14)),
                  color: Colors.blue.shade200,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(cartItem.imageUri),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(right: 8, top: 4),
                        child: Text(
                          cartItem.productName,
                          softWrap: true,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        cartItem.productCategory,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              itemPrice.toString(),
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w900,
                                color: Colors.blue.shade900,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                padding: const EdgeInsets.only(
                                    bottom: 2, right: 12, left: 12),
                                child: Text(
                                  cartItem.productQty.toString(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Container(
            width: 24,
            height: 24,
            alignment: Alignment.center,
            margin: const EdgeInsets.only(right: 10, top: 8),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(4)),
                color: Colors.blue.shade900),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DeleteItemPage(),
                  ),
                );
              },
              child: const Icon(
                Icons.close,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        )
      ],
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final totalPrice = context.read<CartBloc>().getTotalPrice();
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 30),
                child: Text('Total',
                    style: GoogleFonts.mulish(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w600)),
              ),
              Container(
                margin: const EdgeInsets.only(right: 30),
                child: Text(
                  totalPrice.toString(),
                  style: GoogleFonts.mulish(
                    color: Colors.blueAccent.shade700,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class _Subtitle extends StatelessWidget {
  const _Subtitle({Key? key, this.total}) : super(key: key);
  final String? total;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: Text(
        "Total ($total) items",
        style: GoogleFonts.mulish(
          fontSize: 14,
          color: Colors.grey,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
