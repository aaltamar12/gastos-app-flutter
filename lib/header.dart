import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        color: Color.fromARGB(255, 5, 211, 187),
        height: MediaQuery.of(context).size.height * .2109375,
        width: MediaQuery.of(context).size.width,
        child: Column(children: [
          Container(
            padding: const EdgeInsets.only(bottom: 13),
            child: Column(
              children: [
                Text(
                  "Saldo:",
                  style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                ),
                Text(
                  "\$1.000.000",
                  style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 36)),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(children: [
                Container(
                  padding: const EdgeInsets.only(right: 18, bottom: 2),
                  child: Text(
                    "Ingreso",
                    style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 14)),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(right: 18),
                  child: Text(
                    "\$2.400.000",
                    style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 14)),
                  ),
                )
              ]),
              Column(children: [
                Container(
                  padding: const EdgeInsets.only(right: 18, bottom: 2),
                  child: Text(
                    "Egreso",
                    style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 14)),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(right: 18),
                  child: Text(
                    "\$1.200.000",
                    style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 14)),
                  ),
                )
              ])
            ],
          ),
        ]));
  }
}
