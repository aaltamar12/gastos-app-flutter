import 'package:flutter/material.dart';

class ButtonIconMenu extends StatefulWidget {
  IconData icon = Icons.car_rental;
  Color color = const Color(0XFFFFFFFF);
  double size = 28;
  bool alert = true;

  ButtonIconMenu(this.color, this.icon, this.size, this.alert);
  @override
  State<StatefulWidget> createState() {
    return _ButtonIconMenu(color, icon, size, alert);
  }
}

class _ButtonIconMenu extends State<ButtonIconMenu> {
  IconData icon = Icons.car_rental;
  Color color = const Color(0XFFFFFFFF);
  double size = 28;
  bool alert = true;

  void showAlert() {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("AIUDAAAA")));
  }

  void showAlert2() {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("2222")));
  }

  _ButtonIconMenu(this.color, this.icon, this.size, this.alert);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Material(
        borderOnForeground: false,
        color: Colors.transparent,
        child: InkWell(
          splashColor: Color(0XFFFAFAFA),
          borderRadius: BorderRadius.circular(28),
          onTap: alert ? showAlert : showAlert2,
          child: Icon(
            icon,
            size: size,
            color: color,
          ),
        ),
      ),
    );
  }
}
