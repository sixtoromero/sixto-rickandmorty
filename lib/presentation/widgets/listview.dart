import 'package:flutter/material.dart';
import 'package:rickandmorty/domain/entities/character.dart';
import 'package:rickandmorty/presentation/location/locationview.dart';

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
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                      LocationView(model: widget.model)
                                  ),
                                );
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