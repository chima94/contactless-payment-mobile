import 'package:contactless_payment_app/screens/scanproduct/view/scan_product.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OperationWidget extends StatelessWidget {
  const OperationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ScanProductPage(),
              ),
            );
          },
          child: _icon(Icons.qr_code, 'Add To Cart', context),
        ),
        _icon(Icons.history, 'Transaction History', context),
        _icon(Icons.fmd_good, 'Feature Products', context),
      ],
    );
  }

  _icon(IconData icon, String text, BuildContext context) {
    return Column(
      children: [
        Container(
          height: 80,
          width: 80,
          margin: const EdgeInsets.symmetric(vertical: 10),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Color(0xfff3f3f3),
                  offset: Offset(5, 5),
                  blurRadius: 10,
                )
              ]),
          child: Icon(icon),
        ),
        Text(
          text,
          style: GoogleFonts.mulish(
              textStyle: Theme.of(context).textTheme.headline4,
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: const Color(0xff76797e)),
        ),
      ],
    );
  }
}
