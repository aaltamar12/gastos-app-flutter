import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'models/userModel.dart';

class Header extends StatefulWidget {
  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  late Future<dynamic> _balance;
  final currency = NumberFormat("co");
  @override
  void initState() {
    super.initState();
    _balance = getBalance();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color.fromARGB(255, 5, 211, 187),
        height: (MediaQuery.of(context).size.height * .2109375) + 50,
        width: MediaQuery.of(context).size.width,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
                    FutureBuilder(
                      future: _balance,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return _renderBalance(snapshot.data);
                        } else if (snapshot.hasError) {
                          print(snapshot.error);
                          return const Text("error");
                        }

                        return Text(
                          "-",
                          style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: 14)),
                        );
                      },
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
                        child: FutureBuilder(
                          future: _balance,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return _renderEntries(snapshot.data);
                            } else if (snapshot.hasError) {
                              print(snapshot.error);
                              return const Text("error");
                            }

                            return Text(
                              "-",
                              style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      fontSize: 14)),
                            );
                          },
                        ))
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
                        child: FutureBuilder(
                          future: _balance,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return _renderCosts(snapshot.data);
                            } else if (snapshot.hasError) {
                              print(snapshot.error);
                              return const Text("error");
                            }

                            return Text(
                              "-",
                              style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      fontSize: 14)),
                            );
                          },
                        ))
                  ])
                ],
              ),
            ]));
  }

  Text _renderBalance(data) {
    var balance = NumberFormat.simpleCurrency()
        .format(double.parse(data['user_balance']['balance']));
    return Text(
      balance,
      style: GoogleFonts.roboto(
          textStyle: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
              fontSize: 36)),
    );
  }

  Text _renderEntries(data) {
    var entries = NumberFormat.simpleCurrency()
        .format(double.parse(data['user_balance']['entries']));
    return Text(
      entries,
      style: GoogleFonts.roboto(
          textStyle: TextStyle(
              color: Theme.of(context).colorScheme.primary, fontSize: 14)),
    );
  }

  Text _renderCosts(data) {
    var costs = NumberFormat.simpleCurrency()
        .format(double.parse(data['user_balance']['costs']));
    return Text(
      costs,
      style: GoogleFonts.roboto(
          textStyle: TextStyle(
              color: Theme.of(context).colorScheme.primary, fontSize: 14)),
    );
  }
}
