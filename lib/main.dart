//IMPORTAR MATERIAL SIEMPRE
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gastos_app/icons_app_icons.dart';
import 'package:gastos_app/models/dateMovements.dart';
import 'package:gastos_app/models/movementModel.dart';
import 'package:gastos_app/providers/dbProvider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'card_movement.dart';
import 'header.dart';
import 'menu_bar.dart';
import 'package:http/http.dart' as http;

import 'models/userModel.dart';

Future<void> main(List<String> args) async {
  await dotenv.load();
  runApp(Home()); //ESPERA UN WIDGET
}

//EXTIENDE STATEFULWIDGET PARA HACER WIDGETS Y SEAN ACTUALIZABLES
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: GoogleFonts.roboto().fontFamily,
          colorScheme: const ColorScheme.light(primary: Colors.white)),
      home: Scaffold(
        backgroundColor: const Color.fromRGBO(237, 237, 237, 1),
        //SUBMENU
        bottomNavigationBar: MenuBar(),
        //CUERPO DE LA APP
        body: BodyHome(),
      ),
    );
  }
}

//BODY HECHO COMPONENTE
class BodyHome extends StatefulWidget {
  const BodyHome({
    Key? key,
  }) : super(key: key);

  @override
  State<BodyHome> createState() => _BodyHomeState();
}

class _BodyHomeState extends State<BodyHome> {
  //RESPUESTA
  late Future<dynamic> _user;
  late Future<List<DateMovement>> _movements;
  late var today = DateTime.now();
  late var fifteenDays = today.add(const Duration(days: -15));

  //FETCHER

  Future<List<DateMovement>> _getMovements() async {
    //USER ID
    var user = await _user;

    final query = {
      'q[created_at_lteq]': '$today',
      'q[created_at_gteq]': '$fifteenDays',
    };

    //API MOVEMENTS
    var url = Uri.http(dotenv.get('API_URL', fallback: 'Not Found'),
        "/api/movements/user/$user", query);

    final response = await http.get(url).timeout(
      const Duration(seconds: 15),
      onTimeout: () {
        throw ('Timeout request');
      },
    );

    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);
      final Map<String, dynamic> json = jsonDecode(body);

      List<DateMovement> dateMovements = [];

      json["movements"].forEach((date, dateMovement) {
        List<MovementModel> movements = [];

        for (var movement in dateMovement) {
          DBProvider.db.createMovement(MovementModel.fromJson(movement));
          movements.add(MovementModel(
              movement["description"],
              movement["movement_type"],
              movement["title"],
              double.parse(movement["value"]),
              movement["user_id"],
              movement["category"]["icon_font_family"],
              movement["category"]["icon_default"],
              movement["category"]["color_default"],
              movement["created_at"]));
        }
        dateMovements.add(DateMovement(date, movements));
      });

      return dateMovements;
    } else {
      throw Exception("ERROR IN FETCH");
    }
  }

  @override
  void initState() {
    super.initState();
    _user = getUser();
    _movements = _getMovements();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      //crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.255580357143),
          height: MediaQuery.of(context).size.height * .725446429,
          child: RefreshIndicator(
            onRefresh: () {
              Navigator.push(
                  context,
                  PageRouteBuilder(
                      pageBuilder: (a, b, c) => Home(),
                      transitionDuration: const Duration(seconds: 0)));
              return Future.value(false);
            },
            child: FutureBuilder(
              future: _movements,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView(
                      scrollDirection: Axis.vertical,
                      children: _listMovements(snapshot.data));
                } else if (snapshot.hasError) {
                  print(snapshot.error);
                  return const Text("error");
                }

                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ),
        Header()
      ],
    );
  }

  List<Widget> _listMovements(data) {
    List<Widget> movements = [];

    for (var dateMovement in data) {
      movements.add(CardMovement(dateMovement.date, Icons.shopping_bag_outlined,
          const Color(0XFFA387F1), dateMovement));
    }

    return movements;
  }
}
