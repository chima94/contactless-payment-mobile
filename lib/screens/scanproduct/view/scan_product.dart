import 'package:contactless_payment_app/dialog/loading_screen.dart';
import 'package:contactless_payment_app/domain/repositories/user_repository.dart';
import 'package:contactless_payment_app/screens/home/view/widgets/title_text.dart';
import 'package:contactless_payment_app/screens/scanproduct/bloc/scan_product_bloc.dart';
import 'package:contactless_payment_app/screens/scanproduct/bloc/scan_product_event.dart';
import 'package:contactless_payment_app/screens/scanproduct/bloc/scan_product_state.dart';
import 'package:contactless_payment_app/screens/scanproduct/view/qr_scanner_overlay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScanProductPage extends StatelessWidget {
  const ScanProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TittleText(
          text: 'Add To Cart',
          color: Colors.blueGrey,
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.blueGrey),
      ),
      body: BlocProvider(
        create: (_) =>
            ScanProductBloc(userRepository: context.read<UserRepository>()),
        child: const ScanProductView(),
      ),
    );
  }
}

class ScanProductView extends StatelessWidget {
  const ScanProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<ScanProductBloc, ScanProductState>(
      listener: (context, state) {
        if (state.isLoading) {
          LoadingScreen.instance().show(context: context, text: 'please wait');
        } else if (state.msg == 'Success') {
          LoadingScreen.instance().hide();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Added to your cart"),
            ),
          );
        } else {
          LoadingScreen.instance().hide();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.msg),
            ),
          );
        }
      },
      child: const QrScannerView(),
    );
  }
}

class QrScannerView extends StatelessWidget {
  const QrScannerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          MobileScanner(
            allowDuplicates: false,
            onDetect: (barcode, args) {
              if (barcode.rawValue == null) {
                debugPrint('Failed to scan barcode');
              } else {
                final String code = barcode.rawValue!;
                context
                    .read<ScanProductBloc>()
                    .add(AddToCartEvent(productId: code));
              }
            },
          ),
          QRScannerOverlay(overlayColour: Colors.black.withOpacity(0.5))
        ],
      ),
    );
  }
}
