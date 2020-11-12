import 'package:flutter/material.dart';
import 'package:rickandmorty/domain/entities/location.dart';

class LocationView extends StatelessWidget {

  final LocationModel model;
  LocationView({@required  this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 5.0, right: 10.0, bottom: 2.0),
      child: Stack(
        children: [
          _cardItem(context),            
        ],
      ),
    );
  }

  Widget _cardItem(BuildContext context){
    double width = MediaQuery.of(context).size.width * 0.6;

    return Card(
      elevation: 5.0,
      color: Colors.red,
      shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(10.0) ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0), 
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [                
                Text(
                    model.dimension,
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              ],
            ),
          ),
        ],
      )
    );

  }
}