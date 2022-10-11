import 'dart:collection';

import 'package:finalspace/Models/quotes.dart';
import 'package:finalspace/Pages/characterPage.dart';
import 'package:finalspace/Pages/location_page.dart';
import 'package:finalspace/Services/general.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Quotes> listaQuotes = [];

  var random = new Random();

  int? numberRandom;

  Future<bool> getQuotes() async {
    if (listaQuotes.isEmpty) {
      listaQuotes = await General.getQuotes();
      setState(() {
        numberRandom = random.nextInt(listaQuotes.length);
      });

      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getQuotes(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Center(
                      child: Text(
                    'Final Space',
                    style: TextStyle(
                        fontSize: 32,
                        color: Colors.purple,
                        fontWeight: FontWeight.bold),
                  )),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: SizedBox(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              listaQuotes[numberRandom!].quote,
                            ),
                            Text(
                              'by ${listaQuotes[numberRandom!].by}',
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      )),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => CharactersPage(),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: SizedBox(
                                height: 65,
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.purple),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Text(
                                          'CHARACTERS',
                                          style: TextStyle(
                                              color: Colors.purple,
                                              fontSize: 16),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: GestureDetector(
                              onTap: (() => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => LocationPage(),
                                    ),
                                  )),
                              child: SizedBox(
                                height: 65,
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.purple),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Text(
                                          'LOCATIONS',
                                          style: TextStyle(
                                              color: Colors.purple,
                                              fontSize: 16),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          } else {
            return const CircularProgressIndicator();
          }
        }),
      ),
    );
  }
}
