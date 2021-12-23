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
    Icon iconMovement = Icon(
      icon,
      size: 18.8,
    );

    final textCardTitle = Row(
      children: [
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 2),
              child: Icon(
                Icons.calendar_today,
                size: 9,
              ),
            ),
            Text(dateTitle)
          ],
        )
      ],
    );

    final gasto = Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  width: 1, color: Color.fromARGB(50, 165, 165, 165)))),
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 4),
      child: Row(
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

    return Container(
      margin: const EdgeInsets.only(top: 21, left: 18, right: 18),
      padding: const EdgeInsets.only(bottom: 5),
      height: 155,
      width: 378,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                blurRadius: 15,
                color: Color.fromARGB(30, 0, 0, 0),
                offset: Offset(0, 2))
          ]),
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 18),
            padding: EdgeInsets.only(top: 10),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Movement("Salida a restaurante", 17000, icon, colorCategoy),
                    Movement(textTitle, 1000, icon, colorCategoy),
                    Movement(textTitle, 5000, icon, colorCategoy)
                  ],
                )
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                color:
                    today ? const Color(0XFD05D3BB) : const Color(0XFFEAEAEA)),
            padding: EdgeInsets.only(left: 15),
            height: 18,
            width: 378,
            child: textCardTitle,
          )
        ],
      ),
    );
  }
}
