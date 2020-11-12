import 'package:flutter/material.dart';
import 'package:rickandmorty/presentation/home/home.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rick and Morty',
      home: HomeView(),
    );
  }
}