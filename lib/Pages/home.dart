import 'package:carousel_slider/carousel_slider.dart';
import 'package:finalspace/Models/character.dart';
import 'package:finalspace/Services/general.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Character> listaCharacters = [];

  Future<bool> getApi() async {
    if (listaCharacters.isEmpty) {
      listaCharacters = await General.getCharacters();
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: FutureBuilder(
          future: getApi(),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return Center(
                child: SizedBox(
                  height: 700,
                  width: 380,
                  child: PageView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: ((context, index) => Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                border:
                                    Border.all(color: Colors.black, width: 2),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(13.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Stack(
                                      alignment: Alignment.bottomLeft,
                                      children: [
                                        Image.network(
                                          listaCharacters[index].img!,
                                        ),
                                        Container(
                                          decoration: const BoxDecoration(
                                              color: Colors.grey),
                                          child: Text(
                                            listaCharacters[index].name!,
                                            style: const TextStyle(
                                                fontSize: 28,
                                                color: Colors.white),
                                          ),
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Wrap(
                                        spacing: 10,
                                        runSpacing: 5,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.grey,
                                                width: 2,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                Radius.circular(5),
                                              ),
                                            ),
                                            child: Text(
                                                listaCharacters[index].gender!),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.grey,
                                                width: 2,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                Radius.circular(5),
                                              ),
                                            ),
                                            child: Text(
                                                listaCharacters[index].hair!),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.grey,
                                                width: 2,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                Radius.circular(5),
                                              ),
                                            ),
                                            child: Text(
                                                listaCharacters[index].hair!),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.grey,
                                                width: 2,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                Radius.circular(5),
                                              ),
                                            ),
                                            child: Text(
                                                listaCharacters[index].origin!),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.grey,
                                                width: 2,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                Radius.circular(5),
                                              ),
                                            ),
                                            child: Text(
                                                listaCharacters[index].status!),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.grey,
                                                width: 2,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                Radius.circular(5),
                                              ),
                                            ),
                                            child: Text(listaCharacters[index]
                                                .species!),
                                          )
                                        ],
                                      ),
                                    ),
                                    const Text(
                                      'Abilities',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    Wrap(
                                      spacing: 10,
                                      runSpacing: 5,
                                      children: [
                                        for (var ability
                                            in listaCharacters[index].abilities)
                                          Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.grey,
                                                width: 2,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                Radius.circular(5),
                                              ),
                                            ),
                                            child: Text(ability),
                                          )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )),
                      itemCount: listaCharacters.length),
                ),
              );
            } else {
              return Container();
            }
          }),
        ));
  }
}
