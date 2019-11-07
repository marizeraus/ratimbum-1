import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'model/place.dart';


class CreatePlace extends StatefulWidget{
  @override
  CreatePlaceState createState() => CreatePlaceState();
  
}
class CreatePlaceState extends State<CreatePlace>{
  TextEditingController nameController = new TextEditingController();
  TextEditingController observationsController = new TextEditingController();
  TextEditingController placeController = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    final name = TextField(
      controller: nameController,
              obscureText: false,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Nome do Espaço",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))
        ),

    ) ;

    final observations = TextField(controller: observationsController,
          obscureText: false,
          decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Observações do local",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))
        ),
    );

    final local = TextField(controller: placeController,
          obscureText: false,
          decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Localização",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))
        ),
    );

    var file;
    final uploadImage = RaisedButton(
      child: Text("Selecionar imagens"),
      onPressed: (){
        file = choose();
      },
    );

    final fab = FloatingActionButton(onPressed: (){
      List<FileImage> img = new List<FileImage>();
      img.add(FileImage(file));

      var place = new Place(nameController.text, placeController.text, observationsController.text, img);
      print("AEEEE");
    },
    child: Icon(Icons.save),
    );

    return Scaffold(floatingActionButton: fab,
    appBar: AppBar(),
    body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        name,
        file==null ? Text("No Image Selected") : FileImage(file),
        uploadImage,
        observations,
        local,
      ],
    ),
    );
  }
  
  Future<String> choose () async{
    print("entrei");
    var file = await ImagePicker.pickImage(source: ImageSource.gallery);
    return file.path;
  }

}