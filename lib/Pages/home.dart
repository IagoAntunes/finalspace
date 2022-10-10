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
      appBar: AppBar(
        title: const Text('Personagens'),
        backgroundColor: Colors.blueGrey.shade700,
      ),
      body: FutureBuilder(
        future: getApi(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: SizedBox(
                child: PageView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: ((context, index) => Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                              border: Border.all(
                                  color: Colors.blueGrey.shade700, width: 4),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(13.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Imagem(
                                    listaCharacters: listaCharacters,
                                    index: index,
                                  ),
                                  Details(
                                    listaCharacters: listaCharacters,
                                    index: index,
                                  ),
                                  const Text(
                                    'Abilities',
                                    style: TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Abilities(
                                    listaCharacters: listaCharacters,
                                    index: index,
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
            return const CircularProgressIndicator();
          }
        }),
      ),
    );
  }
}

class Imagem extends StatelessWidget {
  const Imagem({
    Key? key,
    required this.listaCharacters,
    required this.index,
  }) : super(key: key);

  final List<Character> listaCharacters;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        //Imagem
        Image.network(
          listaCharacters[index].img!,
          loadingBuilder: ((context, child, loadingProgress) {
            if (loadingProgress == null) {
              return child;
            }
            return const Padding(
              padding: EdgeInsets.all(30),
              child: CircularProgressIndicator(),
            );
          }),
        ),
        //Nome
        Container(
          decoration: BoxDecoration(color: Colors.blueGrey.shade700),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              listaCharacters[index].name!,
              style: const TextStyle(fontSize: 28, color: Colors.white),
            ),
          ),
        )
      ],
    );
  }
}

class Details extends StatelessWidget {
  const Details({
    Key? key,
    required this.listaCharacters,
    required this.index,
  }) : super(key: key);

  final List<Character> listaCharacters;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
              borderRadius: const BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(listaCharacters[index].gender!),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 2,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(listaCharacters[index].hair!),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 2,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(listaCharacters[index].hair!),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 2,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(listaCharacters[index].origin!),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 2,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(listaCharacters[index].status!),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 2,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(listaCharacters[index].species!),
            ),
          )
        ],
      ),
    );
  }
}

class Abilities extends StatelessWidget {
  const Abilities({
    Key? key,
    required this.listaCharacters,
    required this.index,
  }) : super(key: key);

  final List<Character> listaCharacters;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 5,
      children: [
        for (int i = 0;
            i <
                (listaCharacters[index].abilities.length > 5
                    ? 5
                    : listaCharacters[index].abilities.length);
            i++)
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 2,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(listaCharacters[index].abilities[i]),
            ),
          )
      ],
    );
  }
}
