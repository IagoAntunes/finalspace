import 'package:finalspace/Pages/episodes_page.dart';
import 'package:finalspace/Services/general.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../Models/episode.dart';

class ListEpisodes extends StatefulWidget {
  const ListEpisodes({super.key});

  @override
  State<ListEpisodes> createState() => _ListEpisodesState();
}

class _ListEpisodesState extends State<ListEpisodes> {
  List<Episode> listEpisodes = [];
  Future<bool> getApi() async {
    if (listEpisodes.isEmpty) {
      listEpisodes = await General.getEpisodes();
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade700,
      ),
      body: FutureBuilder(
        future: getApi(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        'Episodes',
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 400,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                hintText: 'Digite Algo...',
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: listEpisodes.length,
                    itemBuilder: ((context, index) {
                      return Card(
                        elevation: 2,
                        child: ListTile(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  EpisodesPage(episode: listEpisodes[index]),
                            ),
                          ),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          leading: Image.network(listEpisodes[index].img),
                          title: Text(listEpisodes[index].name),
                          subtitle: Text(listEpisodes[index].date),
                        ),
                      );
                    }),
                  ),
                )
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }),
      ),
    );
  }
}
