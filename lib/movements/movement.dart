import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Movement extends StatelessWidget {
  String textTitle = "COMPRA";
  int amount = 18000;
  IconData icon = Icons.car_rental;
  Color colorCategoy = const Color(0XFFFFFFFF);

  Movement(this.textTitle, this.amount, this.icon, this.colorCategoy);

  @override
  Widget build(BuildContext context) {
    Icon iconMovement = Icon(
      icon,
      size: 18.8,
    );

    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  width: 1, color: Color.fromARGB(50, 165, 165, 165)))),
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              child: Row(
            children: [
              Container(
                  alignment: Alignment.center,
                  height: 31.71,
                  width: 31.71,
                  decoration: BoxDecoration(
                      color: colorCategoy,
                      borderRadius: BorderRadius.circular(100)),
                  child: iconMovement),
              Container(
                  padding: const EdgeInsets.only(left: 14.39),
                  child: Text(textTitle))
            ],
          )),
          Container(
            padding: const EdgeInsets.only(left: 165),
            child: Text(
              "-\$${amount}",
              style:
                  GoogleFonts.roboto(textStyle: const TextStyle(fontSize: 14)),
            ),
          )
        ],
      ),
    );
  }
}
