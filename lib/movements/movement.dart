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
      padding: const EdgeInsets.only(bottom: 3),
      decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  width: 1, color: Color.fromARGB(50, 165, 165, 165)))),
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(
                  height: MediaQuery.of(context).size.height * 0.03739386793,
                  width: MediaQuery.of(context).size.width * 0.0765942029,
                  decoration: BoxDecoration(
                      color: colorCategoy,
                      borderRadius: BorderRadius.circular(100)),
                  child: iconMovement),
              Container(
                  // decoration: BoxDecoration(color: Colors.yellow),
                  width: MediaQuery.of(context).size.width * 0.5325603865,
                  padding: const EdgeInsets.only(left: 14.39),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text(textTitle)],
                  )),
              Container(
                  //decoration: BoxDecoration(color: Colors.teal),
                  width: MediaQuery.of(context).size.width * 0.2355555556,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "- \$$amount",
                        style: GoogleFonts.roboto(
                            textStyle: const TextStyle(fontSize: 14)),
                      ),
                    ],
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
