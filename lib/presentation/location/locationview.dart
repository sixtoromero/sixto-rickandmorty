import 'package:flutter/material.dart';
import 'package:rickandmorty/data/remote/location_api.dart';
import 'package:rickandmorty/domain/entities/character.dart';
import 'package:rickandmorty/domain/entities/location.dart';

class LocationView extends StatelessWidget {
  //const LocationView({Key key}) : super(key: key);

  final Character model;

  LocationView({@required  this.model});

  @override
  Widget build(BuildContext context) {
    
    LocationApi repository = LocationApi(url: model.location.url);

    return Stack(
      children: [
        Image.asset(
          "assets/background.jpg",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            //title: Text('Ubicación'),
          ),
          body: FutureBuilder(
            future: repository.getLocation(),
            builder: (BuildContext context, AsyncSnapshot<List<LocationModel>> snapshot){
              if (snapshot.hasData) {
              
                final items = snapshot.data;
                
                return ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (countext, i) => Column(
                      children: [
                        SizedBox(height: 20),
                        _photoCard(),
                        SizedBox(height: 20),                        
                        _cardItem(items[i], context),
                      ],
                    ),
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
    );
  }

  Widget _cardItem(LocationModel item, BuildContext context) {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(10.0) ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0), 
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Nombre:",
                  style: TextStyle(fontSize: 15, color: Colors.grey[500], fontWeight: FontWeight.bold),
                ),
                Text(
                  item.name,
                  style: TextStyle(fontSize: 12, color: Colors.grey[500]),
                ),
                Text(
                  "Tipo:",
                  style: TextStyle(fontSize: 15, color: Colors.grey[500], fontWeight: FontWeight.bold),
                ),
                Text(
                  item.type,
                  style: TextStyle(fontSize: 15, color: Colors.grey[500]),
                ),
                Text(
                  "Dimensión:",
                  style: TextStyle(fontSize: 15, color: Colors.grey[500], fontWeight: FontWeight.bold),
                ),
                Text(
                  item.dimension,
                  style: TextStyle(fontSize: 15, color: Colors.grey[500]),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _photoCard() {

    final card = Container(
      // clipBehavior: Clip.antiAlias,
      child: Column(
        children: <Widget>[

          FadeInImage(
            image: NetworkImage(model.image),
            placeholder: AssetImage('assets/loading.gif'),
            //fadeInDuration: Duration( milliseconds: 200 ),
            height: 300.0,
            fit: BoxFit.cover,
          ),          
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text(model.name, style: TextStyle(color: Colors.teal, fontSize: 14, fontWeight: FontWeight.bold),)
          ),
        ],
      ),
    );


    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(2.0, 10.0)
          )
        ]
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: card,
      ),
    );

  }

  Widget _cardGradient() {
    return Container(
      // width: double.infinity,
      // height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset(0.0, 0.6),
          end: FractionalOffset(0.0, 1.0),
          colors: [
            Color.fromRGBO(52, 54, 101, 1.0),
            Color.fromRGBO(35, 37, 57, 1.0),            
          ],
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text(model.name, style: TextStyle(color: Colors.teal, fontSize: 14, fontWeight: FontWeight.bold),)
          ),
        ],
      ),
    );
  }

}