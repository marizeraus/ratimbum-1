import 'dart:io';

import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

import 'model/place.dart';

class showPlace extends StatefulWidget{
  Place place;

  showPlace(this.place);
    @override
  ShowPlaceState createState() => ShowPlaceState(place);
}

class ShowPlaceState extends State<showPlace>{
  final Place place;
  ShowPlaceState(this.place);
  @override
  Widget build(BuildContext context) {
    FileImage img = FileImage(File.fromUri(Uri.parse(place.imagepath)));
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[Text(place.name, style: TextStyle(fontSize: 50.0, color: Colors.green)),
                        SizedBox(height: 25.0),
          Text(place.local, style: TextStyle(fontSize: 18.0),),                
          SizedBox(height: 10.0),
          Text(place.observations, style: TextStyle(fontSize: 18.0),),
          SizedBox(height: 25.0),
          Image(image: img,),
          SizedBox(height: 25.0),
          RaisedButton(child: Text("Entrar em Contato"),
          onPressed: (){
            Toast.show("Contato ainda não implementado", context,duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);

          },)],
      ),
    );
    
  } 
}