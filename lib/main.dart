//IMPORTAR MATERIAL SIEMPRE
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gastos_app/icons_app_icons.dart';
import 'package:gastos_app/models/movementModel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'card_movement.dart';
import 'header.dart';
import 'menu_bar.dart';
import 'package:http/http.dart' as http;

void main(List<String> args) {
  runApp(Home()); //ESPERA UN WIDGET
}

//EXTIENDE STATEFULWIDGET PARA HACER WIDGETS Y SEAN ACTUALIZABLES
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int contador = 0;

  void sumar() {
    //ACTUALIZA EL WIDGET
    setState(() {
      contador++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: GoogleFonts.roboto().fontFamily,
          colorScheme: const ColorScheme.light(primary: Colors.white)),
      home: Scaffold(
        backgroundColor: const Color.fromRGBO(237, 237, 237, 1),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 5, 211, 187),
          toolbarHeight: 40,
          elevation: 0.0,
          actions: [
            Container(
                margin: const EdgeInsets.only(right: 15),
                child: const IconButton(
                    onPressed: null,
                    icon: Icon(
                      IconsApp.user,
                      size: 22,
                      color: Colors.white,
                    )))
          ],
        ),
        endDrawer: const Drawer(),
        //SUBMENU
        bottomNavigationBar: MenuBar(),
        //CUERPO DE LA APP
        body: BodyHome(contador: contador),
      ),
    );
  }
}

//BODY HECHO COMPONENTE
class BodyHome extends StatefulWidget {
  const BodyHome({
    Key? key,
    required this.contador,
  }) : super(key: key);

  final int contador;

  @override
  State<BodyHome> createState() => _BodyHomeState();
}

class _BodyHomeState extends State<BodyHome> {
  //RESPUESTA
  late Future<List<MovementModel>> _movements;

  //FETCHER
  var url = Uri.http("192.168.1.13:3000", "/api/movements");

  Future<List<MovementModel>> _getMovements() async {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);
      final json = jsonDecode(body);

      print("LE PEGUE");

      List<MovementModel> movements = [];

      for (var movement in json["movements"]) {
        print(movement);
        movements.add(MovementModel(
            movement["description"],
            movement["movement_type"],
            movement["title"],
            double.parse(movement["value"]),
            movement["user_id"],
            movement["created_at"]));
      }
      return movements;
    } else {
      throw Exception("ERROR IN FETCH");
    }
  }

  @override
  void initState() {
    super.initState();
    _movements = _getMovements();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      //crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * .2109375),
          height: MediaQuery.of(context).size.height * .725446429,
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
        Header()
      ],
    );
  }

  List<Widget> _listMovements(data) {
    List<Widget> movements = [];

    for (var movement in data) {
      // movements.add(CardMovement(
      //     "22-ago-2021",
      //     movement.title,
      //     true,
      //     movement.value,
      //     Icons.shopping_bag_outlined,
      //     const Color(0XFFA387F1)));
      movements.add(CardMovement(true, Icons.shopping_bag_outlined,
          const Color(0XFFA387F1), movements));
    }

    return movements;
  }
}
