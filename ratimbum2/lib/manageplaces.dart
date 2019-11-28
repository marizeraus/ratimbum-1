import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ratimbum2/model/globals.dart' as globals;
import 'package:ratimbum2/searchpage.dart';
import 'package:ratimbum2/showplace.dart';

class managePlaces extends StatefulWidget {

  @override
  managePlacesState createState() => managePlacesState();
}

class managePlacesState extends State<managePlaces> {
  TextEditingController searchController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        backgroundColor: Colors.orange
      ),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: displayList(),        
            ),
          )
        )
      ),
    drawer: globals.selectdrawer(context)
    );
  }

  List<Widget> displayList(){
    List<Widget> widgetList = new List<Widget>();
    for(var i=0; i<globals.placelist.length; i++){
      var place = globals.placelist[i];
      var image;
      if(place.isasset){
        image = Image.asset(place.imagepath);
      }
      else{
        image = Image(image: FileImage(File.fromUri(Uri.parse(place.imagepath))));
      }
      if (globals.myplaces.contains(place.id)&& place.exists){
        widgetList.add(
          new GestureDetector(
          onTap: (){
            globals.searchPlace("flamengo");
          Navigator.push(context, MaterialPageRoute(builder: (context) => showPlace(place)));
          },
          child: Container(
            margin: new EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
            padding: new EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
            decoration: new BoxDecoration(
              color: Color.fromRGBO(253, 227, 211, 1),
              shape: BoxShape.rectangle,
              borderRadius: new BorderRadius.circular(15.0),
            ),
            child: Column(children: <Widget>[
            image,
            SizedBox(height:6.0),
            Text(place.name, style: TextStyle(fontSize: 22,fontFamily: 'Montserrat',),),
            Text(place.local, style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic, fontFamily: 'Montserrat'),),
            RaisedButton(onPressed: (){
              place.exists = false;
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => managePlaces()));
              print("removi");
            }, child: Text("Remover"),),
            //RaisedButton(onPressed: (){}, child: Text("Editar"),),
            ],),),
            )
          );
      }
    }
    return widgetList;
  }

}