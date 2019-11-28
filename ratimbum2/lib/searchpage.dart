import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ratimbum2/model/globals.dart' as globals;
import 'package:ratimbum2/showplace.dart';

class searchPage extends StatefulWidget {
  var placelist;
  searchPage(var placelist){
    this.placelist = placelist;
  }

  @override
  searchPageState createState() => searchPageState(placelist);
}

class searchPageState extends State<searchPage> {
  TextEditingController searchController = new TextEditingController();
  var placelist;

  searchPageState(var placelist){
    this.placelist = placelist;
  }
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
            child: Padding(
            padding: const EdgeInsets.all(36.0),
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: displayList(),        
            ),
          ),
          )
        )
      ),
    drawer: globals.selectdrawer(context)
    );
  }

  List<Widget> displayList(){
    List<Widget> widgetList = new List<Widget>();
    for(var i=0; i<placelist.length; i++){
      var place = placelist[i];
      var image;
      if(place.isasset){
        image = Image.asset(place.imagepath);
      }
      else{
        image = Image(image: FileImage(File.fromUri(Uri.parse(place.imagepath))));
      }
      
      widgetList.add(
        new GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => showPlace(place)));
        },
        child: Container(
          padding: new EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
          color: Colors.green,
          child: Column(children: <Widget>[
          image,
          Text(place.name),
          Text(place.local)

          ],),),
          )
        );
      widgetList.add(SizedBox(height:10.0));
    }
    return widgetList;
  }
}