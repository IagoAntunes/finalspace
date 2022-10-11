import 'package:finalspace/Models/character.dart';
import 'package:finalspace/Models/location.dart';
import 'package:finalspace/Services/general.dart';
import 'package:flutter/material.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  List<Location> listaLocations = [];

  Future<bool> getApi() async {
    if (listaLocations.isEmpty) {
      listaLocations = await General.getLocations();
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Locations'),
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
                                    listaLocations: listaLocations,
                                    index: index,
                                  ),
                                  Details(
                                    listaLocations: listaLocations,
                                    index: index,
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child: Text(
                                      'Inhabitants',
                                      style: TextStyle(
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Abilities(
                                    listaLocations: listaLocations,
                                    index: index,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )),
                    itemCount: listaLocations.length),
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
    required this.listaLocations,
    required this.index,
  }) : super(key: key);

  final List<Location> listaLocations;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        //Imagem
        Image.network(
          listaLocations[index].img!,
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
              listaLocations[index].name!,
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
    required this.listaLocations,
    required this.index,
  }) : super(key: key);

  final List<Location> listaLocations;
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
              child: Text(listaLocations[index].name!),
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
              child: Text(listaLocations[index].type!),
            ),
          ),
        ],
      ),
    );
  }
}

class Abilities extends StatelessWidget {
  const Abilities({
    Key? key,
    required this.listaLocations,
    required this.index,
  }) : super(key: key);

  final List<Location> listaLocations;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 5,
      children: [
        for (var inhabitant in listaLocations[index].inhabitants)
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
              child: Text(inhabitant),
            ),
          )
      ],
    );
  }
}
