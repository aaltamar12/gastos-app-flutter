import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gastos_app/movements/movement.dart';
import 'package:google_fonts/google_fonts.dart';

class CardMovement extends StatelessWidget {
  String dateTitle = "22-ago-2021";
  String textTitle = "COMPRA";
  bool today = false;
  int amount = 18000;
  IconData icon = Icons.car_rental;
  Color colorCategoy = const Color(0XFFFFFFFF);

  CardMovement(this.dateTitle, this.textTitle, this.today, this.amount,
      this.icon, this.colorCategoy);

  @override
  Widget build(BuildContext context) {
    final textCardTitle = Row(
      children: [
        Row(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 2),
              child: const Icon(
                Icons.calendar_today,
                size: 9,
              ),
            ),
            Text(dateTitle)
          ],
        )
      ],
    );

    return Container(
      margin: const EdgeInsets.only(top: 21, left: 18, right: 18),
      padding: const EdgeInsets.only(bottom: 5),
      height: 155,
      width: 378,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
                blurRadius: 15,
                color: Color.fromARGB(30, 0, 0, 0),
                offset: Offset(0, 2))
          ]),
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 18),
            padding: const EdgeInsets.only(top: 10),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Movement("Salida a restaurante con mi novia en Rodizio",
                        166670000, icon, colorCategoy),
                    Movement(textTitle, 1000, icon, colorCategoy),
                    Movement(textTitle, 5000, icon, colorCategoy)
                  ],
                )
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                color:
                    today ? const Color(0XFD05D3BB) : const Color(0XFFEAEAEA)),
            padding: const EdgeInsets.only(left: 15),
            height: 18,
            width: 378,
            child: textCardTitle,
          )
        ],
      ),
    );
  }
}
