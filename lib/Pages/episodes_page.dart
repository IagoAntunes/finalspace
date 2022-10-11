import 'package:finalspace/Services/general.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../Models/episode.dart';

class EpisodesPage extends StatelessWidget {
  EpisodesPage({super.key, required this.episode});

  List<Episode> listEpisodes = [];
  Episode episode;

  getApi() async {
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(episode.img), fit: BoxFit.cover),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Center(
                              child: Text(
                                episode.name,
                                style: const TextStyle(
                                    fontSize: 32, fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                          Text(
                            'Date: ${episode.date}',
                            style: const TextStyle(fontSize: 18),
                          ),
                          Text(
                            'Director: ${episode.director}',
                            style: const TextStyle(fontSize: 18),
                          ),
                          Text(
                            'Writer: ${episode.writer}',
                            style: const TextStyle(fontSize: 18),
                          )
                        ]),
                  ),
                ),
              ],
            );
          } else {
            return const CircularProgressIndicator();
          }
        }),
      ),
    );
  }
}
