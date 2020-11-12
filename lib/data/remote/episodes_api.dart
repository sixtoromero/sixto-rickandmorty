import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:rickandmorty/domain/entities/episode.dart';

class EpisodesApi {

  final String url;
  EpisodesApi({@required this.url});  

  Future<List<Episode>> getEpisodes() async {
    final resp = await http.get(url);      
    final Map<String, dynamic> decodedData = json.decode(resp.body);

    print(decodedData);

    final List<Episode> episodes = new List();

    if (decodedData == null) return [];
    
    dynamic result = decodedData['results'];

    result.forEach((value) {
      final itemTemp = Episode.fromJson(value);
      episodes.add(itemTemp);
    });

    print(episodes);

    return episodes;

  }
}