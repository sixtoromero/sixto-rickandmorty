import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:rickandmorty/domain/entities/location.dart';

class LocationApi {

  final String url;
  LocationApi({@required this.url});  

  Future<List<LocationModel>> getLocation() async {
    final resp = await http.get(url);      
    final Map<String, dynamic> decodedData = json.decode(resp.body);

    //print(decodedData);

    final List<LocationModel> episodes = new List();

    if (decodedData == null) return [];
    
    dynamic result = decodedData;

    final itemTemp = LocationModel.fromJson(result);
    episodes.add(itemTemp);

    print(episodes);

    return episodes;

  }
}