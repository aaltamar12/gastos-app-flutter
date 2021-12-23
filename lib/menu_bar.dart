import 'package:flutter/material.dart';
import 'button_icon_menu.dart';

class MenuBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MenuBar();
  }
}

class _MenuBar extends State<MenuBar> {
  @override
  Widget build(BuildContext context) {
    Color color = Colors.white;
    return Container(
      height: MediaQuery.of(context).size.height * .0636160714,
      color: const Color.fromARGB(255, 5, 211, 187),
      child: Container(
        margin: EdgeInsets.only(left: 24),
        child: Row(
          children: [
            Container(
                margin: EdgeInsets.only(right: 5),
                child: ButtonIconMenu(color, Icons.search, true)),
            Container(
                margin: EdgeInsets.only(right: 5),
                child: ButtonIconMenu(color, Icons.add, true)),
            Container(
                margin: EdgeInsets.only(right: 5),
                child: ButtonIconMenu(color, Icons.donut_small_sharp, false))
          ],
        ),
      ),
    );
  }
}
