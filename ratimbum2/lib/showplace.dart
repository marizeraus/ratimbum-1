import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ratimbum2/model/globals.dart';
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
      ),
      drawer: selectdrawer(context),
      body: SingleChildScrollView(
        child:Column(
      
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
            Align(alignment: Alignment.centerLeft,
            child: getimage(),),

            Align(child: Container(child:Text(place.name, style: TextStyle(fontSize: 36.0, color: Colors.orange))),
            alignment: Alignment.centerLeft),
            Align(child: Container(child:Text(place.local, style: TextStyle(fontSize: 18.0),)),
            alignment: Alignment.centerLeft,),
            SizedBox(height: 10.0),
            Align(child: Container(child:Text(place.observations, style: TextStyle(fontSize: 18.0),)),
            alignment: Alignment.centerLeft,),
            SizedBox(height: 25.0),
            SizedBox(height: 25.0),
            RaisedButton(child: Text("Entrar em Contato"),
            onPressed: (){
              if(isloggedin)
              showAlertDialog1(context);
              else
              Toast.show("É necessário logar para ver essa informação", context, duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
            },)],
      ),
      )
    );
    
  }

  showAlertDialog1(BuildContext context) 
{ 
    // configura o button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () { 
    },
  );
  // configura o  AlertDialog
  AlertDialog alerta = AlertDialog(
    title: Text("Telefone de Contato"),
    content: Text(place.phone),
    actions: [
      okButton,
    ],
  );
  // exibe o dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alerta;
    },
  );
}

Widget getimage(){
  if(place.isasset){
    return Image.asset(place.imagepath);
  }
  else{
    return Image(image: FileImage(File.fromUri(Uri.parse(place.imagepath))));
  }
}
 
}