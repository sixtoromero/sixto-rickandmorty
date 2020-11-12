import 'package:flutter/material.dart';
import 'package:rickandmorty/domain/entities/character.dart';
import 'package:rickandmorty/domain/repostories/character_repository.dart';
import 'package:rickandmorty/presentation/widgets/listview.dart';

class CharactersView extends StatelessWidget {
  //const CharactersView({Key key}) : super(key: key);
  
  CharacterRepository repository = CharacterRepository();

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Color(0XFF26ADC1),
      appBar: AppBar(title: Text('Rick and Morty'),),
      body: FutureBuilder(
          future: repository.getCharacters(),
          builder: (BuildContext context, AsyncSnapshot<List<Character>> snapshot){
            if (snapshot.hasData) {

            final items = snapshot.data;
            
            return ListView.builder(
                itemCount: items.length,
                itemBuilder: (countext, i) => ListViewPage(model: items[i]),
            );
            } else {
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                ),
              );
            }
          }
        ),
    );
  }
}