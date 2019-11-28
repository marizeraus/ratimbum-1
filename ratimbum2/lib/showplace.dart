import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ratimbum2/model/globals.dart';
import 'package:ratimbum2/searchpage.dart';
import 'package:toast/toast.dart';
import 'package:ratimbum2/model/globals.dart' as globals;
import 'model/place.dart';

class showPlace extends StatefulWidget{
  Place place;

  showPlace(this.place);
    @override
  ShowPlaceState createState() => ShowPlaceState(place);
}

class ShowPlaceState extends State<showPlace>{
  final Place place;
  var searchController = new TextEditingController();

  ShowPlaceState(this.place);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
                title: TextField(
          controller: searchController,
          decoration: InputDecoration(hintText: "Pesquisar"),
        ),
        actions: <Widget>[
        
            IconButton(onPressed: (){
              if(searchController.text.length>0){
                Navigator.push(context, MaterialPageRoute(builder: (context) => searchPage(globals.searchPlace(searchController.text))));
              }
          },
          icon: Icon(Icons.search))

        ],

      ),
      drawer: selectdrawer(context),
      body: SingleChildScrollView(
        child:Column(
      
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
            Align(alignment: Alignment.centerLeft,
            child: getimage(),),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Align(child: Container(child:Text(place.name, style: TextStyle(fontSize: 30.0, fontStyle: FontStyle.italic))),
              alignment: Alignment.centerLeft)),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child:Align(child: Container(child:Text(place.local, style: TextStyle(fontSize: 18.0, color: Colors.grey, fontStyle: FontStyle.italic),)),
              alignment: Alignment.centerLeft,),),
            SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child:Align(child: Container(child:Text(place.observations, style: TextStyle(fontSize: 18.0),)),
              alignment: Alignment.centerLeft,)),
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
  // configura o  AlertDialog
  AlertDialog alerta = AlertDialog(
    title: Text("Telefone de Contato"),
    content: Text(place.phone),
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
    return Padding(
              padding: const EdgeInsets.all(10),
              child: Image.asset(place.imagepath));
  }
  else{
    return Padding(
              padding: const EdgeInsets.all(10),
              child:Image(image: FileImage(File.fromUri(Uri.parse(place.imagepath)))));
  }
}
 
}