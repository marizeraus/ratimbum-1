
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class sucesspage extends StatelessWidget{
  String email;

  sucesspage(String text){
    this.email=text;
  }


   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sucesso"),
      ),
      body: Center(
        child: Text(email),
    )
    );
  }

  
}