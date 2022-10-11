import 'dart:convert';

import 'package:finalspace/Models/character.dart';
import 'package:finalspace/Models/episode.dart';
import 'package:finalspace/Models/location.dart';
import 'package:finalspace/Models/quotes.dart';
import 'package:http/http.dart' as http;

class General {
  static getCharacters() async {
    final response = await http.get(
      Uri.parse('https://finalspaceapi.com/api/v0/character/'),
    );
    List<dynamic> dataList = [];
    List<Character> listaCharacters = [];
    if (response.statusCode == 200) {
      dataList = jsonDecode(response.body);
      for (var data in dataList) {
        final map = {
          'id': data['id'],
          'name': data['name'],
          'status': data['status'],
          'species': data['species'],
          'gender': data['gender'],
          'hair': data['hair'],
          'origin': data['origin'],
          'img': data['img_url'],
          'abilities': data['abilities'],
        };
        listaCharacters.add(Character.fromMap(map));
      }
    }
    return listaCharacters;
  }

  static getLocations() async {
    final response = await http.get(
      Uri.parse('https://finalspaceapi.com/api/v0/location/'),
    );
    List<dynamic> dataList = [];
    List<Location> listaLocations = [];
    if (response.statusCode == 200) {
      dataList = jsonDecode(response.body);
      for (var data in dataList) {
        final map = {
          'id': data['id'],
          'name': data['name'],
          'type': data['type'],
          'inhabitants': data['inhabitants'],
          'img': data['img_url'],
        };
        listaLocations.add(Location.fromMap(map));
      }
    }
    return listaLocations;
  }

  static getEpisodes() async {
    final response = await http.get(
      Uri.parse('https://finalspaceapi.com/api/v0/episode/'),
    );
    List<dynamic> dataList = [];
    List<Episode> listEpisodes = [];
    if (response.statusCode == 200) {
      dataList = jsonDecode(response.body);
      for (var data in dataList) {
        final map = {
          'id': data['id'],
          'name': data['name'],
          'date': data['air_date'],
          'director': data['director'],
          'writer': data['writer'],
          'img': data['img_url'],
        };
        listEpisodes.add(Episode.fromMap(map));
      }
    }
    return listEpisodes;
  }

  static getQuotes() async {
    final response = await http.get(
      Uri.parse('https://finalspaceapi.com/api/v0/quote/'),
    );
    List<Quotes> listaQuotes = [];

    if (response.statusCode == 200) {
      List<dynamic> dataQuotes = jsonDecode(response.body);
      for (var data in dataQuotes) {
        final map = {
          'id': data['id'],
          'quote': data['quote'],
          'by': data['by'],
          'character': data['character'],
          'image': data['image'],
        };
        listaQuotes.add(Quotes.fromMap(map));
      }
    }
    return listaQuotes;
  }
}
