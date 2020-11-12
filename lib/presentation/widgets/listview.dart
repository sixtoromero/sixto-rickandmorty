import 'package:flutter/material.dart';
import 'package:rickandmorty/data/remote/episodes_api.dart';
import 'package:rickandmorty/data/remote/location_api.dart';
import 'package:rickandmorty/domain/entities/character.dart';
import 'package:rickandmorty/domain/entities/location.dart';
import 'package:rickandmorty/domain/repostories/character_repository.dart';
import 'package:rickandmorty/presentation/widgets/episodesview.dart';
import 'package:rickandmorty/presentation/widgets/locationview.dart';

class ListViewPage extends StatefulWidget {

    final Character model;

    ListViewPage({@required  this.model});

  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
    @override
    Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.only(left: 10.0, top: 5.0, right: 10.0, bottom: 2.0),
        child: Stack(
          children: [
            _cardItem(),            
          ],
        ),
      );
    }

    Widget _cardItem() {
      
      double width = MediaQuery.of(context).size.width * 0.6;

      return Card(
        elevation: 5.0,
        shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(10.0) ),
        child: Row(
          children: [
            Container(
              width: 100,
              height: 90,
              child: FadeInImage(                    
                placeholder: AssetImage('assets/loading.gif'),                                     
                image: NetworkImage(widget.model.image),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0), 
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.model.name,
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10,),                    
                  Container(
                    width: width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [                          
                        Text(
                          widget.model.species,
                          style: TextStyle(fontSize: 15, color: Colors.grey[500]),
                        ),
                        Text(
                          widget.model.status,
                          style: TextStyle(fontSize: 15, color: Colors.grey[500]),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            TextButton(
                              child: const Text('Episodios'),
                              onPressed: () {
                                //showDialogFunc(context, widget.model);
                              },
                            ),
                            const SizedBox(width: 8),
                            TextButton(
                              child: const Text('Locaciones'),
                              onPressed: () {
                                showDialogFunc(context, widget.model);
                              },
                            ),
                            const SizedBox(width: 8),
                          ],
                        ),                         
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        )
      );
    }
}

showDialogFunc(BuildContext context, Character model) {
  
  //CharacterRepository repository = CharacterRepository();

  LocationApi repository = LocationApi(url: model.location.url);

  return showDialog(
    context: context,
    builder: (context){
      return Center(
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,                
            ),
            padding: EdgeInsets.all(15),
            width: MediaQuery.of(context).size.width * 0.7,
            height: 320,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(
                    model.image,
                    width: 200,
                    height: 200,
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  child: FutureBuilder(
                    future: repository.getLocation(),
                    builder: (BuildContext context, AsyncSnapshot<List<LocationModel>> snapshot){
                      if (snapshot.hasData) {
                      
                      final items = snapshot.data;
                      
                      return ListView.builder(
                          itemCount: items.length,
                          itemBuilder: (countext, i) => LocationView(model: items[i]),
                      );
                      } else {
                        return Center(child: CircularProgressIndicator(
                          backgroundColor: Colors.white,
                        ),);
                      }
                    }
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  );
}