//IMPORTAR MATERIAL SIEMPRE
import 'package:flutter/material.dart';
import 'package:gastos_app/icons_app_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'card_movement.dart';
import 'header.dart';
import 'menu_bar.dart';

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
        //BOTON FLOTANTE A LA DERECHA
        // floatingActionButton: Container(
        //   height: 60,
        //   width: 60,
        //   child: FloatingActionButton(
        //     onPressed: () {
        //       sumar();
        //     },
        //     backgroundColor: Color.fromARGB(255, 255, 193, 7),
        //     child: const Icon(Icons.add, size: 26.25),
        //   ),
        // ),
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
  @override
  Widget build(BuildContext context) {
    return Stack(
      //crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * .2109375),
          height: MediaQuery.of(context).size.height * .725446429,
          child: ListView(scrollDirection: Axis.vertical, children: [
            CardMovement("22-ago-2021", "COMPRA", true, 18000,
                Icons.shopping_bag_outlined, const Color(0XFFA387F1)),
            CardMovement("22-ago-2021", "COMPRA", false, 3000,
                Icons.fastfood_outlined, const Color(0XFFFF916E)),
            CardMovement("22-ago-2021", "COMPRA", false, 88000,
                Icons.contact_page_outlined, const Color(0XFF04EEEE)),
            CardMovement("22-ago-2021", "COMPRA", false, 40000,
                Icons.shopping_bag_outlined, const Color(0XFFA387F1)),
            CardMovement("22-ago-2021", "COMPRA", false, 2500,
                Icons.fastfood_outlined, const Color(0XFFFF916E)),
            CardMovement("22-ago-2021", "COMPRA", false, 1100,
                Icons.contact_page_outlined, const Color(0XFF04EEEE))
          ]),
        ),
        Header()
      ],
    );
  }
}
