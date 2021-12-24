import 'package:flutter/material.dart';
import 'button_icon_menu.dart';

class MenuBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MenuBar();
  }
}

class _MenuBar extends State<MenuBar> {
  @override
  Widget build(BuildContext context) {
    Color color = Colors.white;
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          color: Color.fromARGB(255, 5, 211, 187),
          boxShadow: [
            BoxShadow(
                blurRadius: 20,
                color: Color.fromARGB(40, 0, 0, 0),
                offset: Offset(0, -2))
          ]),
      height: MediaQuery.of(context).size.height * .0636160714,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(
                    margin: const EdgeInsets.only(right: 5),
                    child: ButtonIconMenu(color, Icons.search, 28, true)),
                Container(
                    margin: const EdgeInsets.only(right: 5),
                    child: ButtonIconMenu(
                        color, Icons.donut_small_sharp, 28, false))
              ],
            ),
            Container(
                margin: const EdgeInsets.only(right: 5),
                child: Container(
                    height: 49,
                    width: 49,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFFFC107),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 4,
                              color: Color.fromARGB(40, 0, 0, 0),
                              offset: Offset(0, 2))
                        ]),
                    child: ButtonIconMenu(color, Icons.add, 32, true))),
            Row(
              children: [
                Container(
                    margin: const EdgeInsets.only(right: 5),
                    child: ButtonIconMenu(color, Icons.search, 28, true)),
                Container(
                    margin: const EdgeInsets.only(right: 5),
                    child: ButtonIconMenu(
                        color, Icons.donut_small_sharp, 28, false))
              ],
            )
          ],
        ),
      ),
    );
  }
}
