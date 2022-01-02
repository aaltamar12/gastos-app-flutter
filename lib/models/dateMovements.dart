import 'package:gastos_app/models/movementModel.dart';

import 'movementModel.dart';

class DateMovement {
  String date = "";
  List<MovementModel> movements = [];

  DateMovement(this.date, this.movements);
}
