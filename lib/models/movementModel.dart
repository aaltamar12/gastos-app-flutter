import 'dart:convert';

List<MovementModel> employeeFromJson(String str) => List<MovementModel>.from(
    json.decode(str).map((x) => MovementModel.fromJson(x)));

class MovementModel {
  String description;
  String movementType;
  String title;
  double value;
  String userId;
  String iconFontFamily;
  String icon;
  String colorCategory;
  String createdAt;

  MovementModel(
      this.description,
      this.movementType,
      this.title,
      this.value,
      this.userId,
      this.iconFontFamily,
      this.icon,
      this.colorCategory,
      this.createdAt);

  factory MovementModel.fromJson(Map<String, dynamic> json) => MovementModel(
        json["description"],
        json["movement_type"],
        json["title"],
        json["value"],
        json["user_id"],
        json["icon_font_family"],
        json["icon"],
        json["color_default"],
        json["created_at"],
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "movementType": movementType,
        "title": title,
        "value": value,
        "userId": userId,
        "iconFontFamily": iconFontFamily,
        "icon": icon,
        "colorCategory": colorCategory,
        "createdAt": createdAt,
      };
}
