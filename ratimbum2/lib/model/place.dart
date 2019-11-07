import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:convert';

class Place{
  String name;
  String local;
  String observations;
  List<File> imagelist;


  Place(String name, String local, String observations, List<File> imagelist){
    this.name = name;
    this.local = local;
    this.observations = observations;
    this.imagelist = imagelist;
    print(imagelist.first.path);
  }

  Map<String, dynamic> toJson() =>
    {
      'name': name,
      'observations': observations,
      'local': local,
      'image': imagelist.first.path
    };


    void createFile() async {
    var dir = await getApplicationSupportDirectory();
    print("Creating file!");
    File file = new File(dir.path + "/" + "criado.json");
    file.createSync();
    file.writeAsStringSync(toJson().toString());
    print(file.path);
    File file2 = File.fromUri(Uri.parse(dir.path+"/"+"criado.json"));
  }

}