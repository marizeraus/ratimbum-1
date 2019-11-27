import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ratimbum2/network/login.dart';
import 'package:ratimbum2/register.dart';
import 'package:ratimbum2/showplace.dart';
import 'package:ratimbum2/sucesspage.dart';
import 'package:ratimbum2/model/globals.dart' as globals;
import 'package:sqflite/sqflite.dart';

import 'model/db_test.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {


  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Ra Tim Bum'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  _MyHomePageState(){
  }
  @override
  Widget build(BuildContext context) {
    globals.setplaces();




    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(hintText: "Pesquisar"),
        ),
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
    for(var i=0; i<globals.placelist.length; i++){
      var place = globals.placelist[i];
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
          globals.searchPlace("flamengo");
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