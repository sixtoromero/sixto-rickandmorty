import 'package:flutter/material.dart';
import 'package:rickandmorty/data/remote/episodes_api.dart';
import 'package:rickandmorty/domain/entities/episode.dart';

class EpisodeRepository {  

  final String url;
  EpisodeRepository({@required this.url});

  Future<List<Episode>> getCharacters() async {
    EpisodesApi api = EpisodesApi(url: url);
    return await api.getEpisodes();
  }
}

//EpisodesApi
