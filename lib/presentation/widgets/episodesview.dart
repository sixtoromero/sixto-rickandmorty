import 'package:flutter/material.dart';

class EpisodesView extends StatelessWidget {

  // final String urlEpisode;

  // EpisodesView({@required this.urlEpisode});

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
      shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(10.0) ),
      
    );

  }
}