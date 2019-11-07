import 'dart:io';

import 'package:flutter/widgets.dart';

class Place{
  String name;
  String local;
  String observations;
  List<FileImage> imagelist;

  Place(String name, String local, String observations, List<FileImage> imagelist){
    this.name = name;
    this.local = local;
    this.observations = observations;
    this.imagelist = imagelist;
  }

}