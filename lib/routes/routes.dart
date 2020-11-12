import 'package:flutter/material.dart';
import 'package:rickandmorty/presentation/home/home.dart';
import 'package:rickandmorty/presentation/location/locationview.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return  <String, WidgetBuilder>{
    'home'          : (BuildContext context) => HomeView(),    
  };
}