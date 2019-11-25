import 'package:flutter/material.dart';
import 'package:ratimbum2/model/globals.dart' as globals;
bool isloggedin = false;

Widget selectdrawer(BuildContext context){
  if (globals.isloggedin){

    return Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('NOME'),
              decoration: BoxDecoration(
                color: Colors.orange,
              ),
            ),
            ListTile(
              title: Text('Cadastrar Espaços'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Gerenciar Espaços'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            Container(
              alignment: FractionalOffset.bottomCenter,
              child: 
            ListTile(
              title: Text('Sair'),
              onTap: (){
                Navigator.pop(context);
              },
              ),
              color: Colors.red,          
            )
          ],
        ),
      );
  }
      return Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Ra Tim Bum'),
              decoration: BoxDecoration(
                color: Colors.green,
              ),
            ),
            ListTile(
              title: Text('Login'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Cadastrar'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                globals.isloggedin = true;
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );

}