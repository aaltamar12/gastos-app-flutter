import 'package:flutter/material.dart';

class ButtonIconMenu extends StatefulWidget {
  IconData icon = Icons.car_rental;
  Color color = const Color(0XFFFFFFFF);
  bool alert = true;

  ButtonIconMenu(this.color, this.icon, this.alert);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ButtonIconMenu(color, icon, alert);
  }
}

class _ButtonIconMenu extends State<ButtonIconMenu> {
  IconData icon = Icons.car_rental;
  Color color = const Color(0XFFFFFFFF);
  bool alert = true;

  void showAlert() {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("AIUDAAAA")));
  }

  void showAlert2() {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("2222")));
  }

  _ButtonIconMenu(this.color, this.icon, this.alert);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(top: 15, bottom: 14),
      child: Material(
        borderOnForeground: false,
        color: Colors.transparent,
        child: InkWell(
          splashColor: Color(0XFFFAFAFA),
          borderRadius: BorderRadius.circular(28),
          onTap: alert ? showAlert : showAlert2,
          child: Icon(
            icon,
            size: 28,
            color: color,
          ),
        ),
      ),
    );
  }
}
