import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class UserModel {
  String name;

  UserModel(this.name);
}

getUser() async {
  return "f97b02a8-7bbf-4e37-9773-319ca350f6b5";
}

getBalance() async {
  //USER ID
  var user = await getUser();

  //API MOVEMENTS
  var url = Uri.http(dotenv.get('API_URL', fallback: 'Not Found'),
      "/api/movements/user/$user/balance");

  final response = await http.get(url).timeout(
    const Duration(seconds: 15),
    onTimeout: () {
      throw ('Timeout request');
    },
  );

  if (response.statusCode == 200) {
    String body = utf8.decode(response.bodyBytes);
    final Map<String, dynamic> json = jsonDecode(body);

    return json;
  } else {
    throw Exception("ERROR IN BALANCE FETCH");
  }
}
