import 'package:flutter/material.dart';
import 'package:ratimbum2/createplace.dart';
import 'package:ratimbum2/loginpage.dart';
import 'package:ratimbum2/main.dart';
import 'package:ratimbum2/model/data.dart';
import 'package:ratimbum2/model/globals.dart' as globals;
import 'package:ratimbum2/model/place.dart';
import 'package:ratimbum2/register.dart';
import 'package:sqflite/sqflite.dart';
bool isloggedin = false;


Response response;

List<Place> placelist = new List<Place>();

void setplaces(){
  if(placelist.length>0) return;
  var place = new Place(1, "Casa de Festas Chique", "São Paulo", "Casa de Festas com bela vista, para até 200 pessoas, no coração de São Paulo", "lib/assets/festa1.jpeg", "(11)98002-9763", true);
  placelist.add(place);
  placelist.add(new Place(2, "Churrasqueira na Gávea", "Rio de Janeiro", "Churrasqueira localizada no Clube de Regatas do Flamengo, na Gávea, para até 50 pessoas", "lib/assets/festa2.jpeg", "(21)2742-0690", true));
  placelist.add(new Place(3, "Pool Party", "Niterói", "Local ideal para festas na piscina, com buffet para até 100 pessoas", "lib/assets/festa3.jpeg", "(21)2742-0690", true));
  placelist.add(new Place(4, "Campo Sintético", "Rio de Janeiro", "Local com campo sintético e churrasqueira, aluguel do campo por hora, capacidade 40 pessoas", "lib/assets/festa4.jpeg", "(21)3600-2931", true));
  placelist.add(new Place(5, "Casa de Festas 2 andares", "Teresópolis", "Casa perfeita para casamentos e festas de debutante, com dois andare , pista de dança, possibilidade de buffet e capacidade de 300 pessoas", "lib/assets/festa5.jpeg", "(21)98110-2830", true));
}

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
              child: Text(response.data.fullName),
              decoration: BoxDecoration(
                color: Colors.orange,
              ),
            ),
              ListTile(
              title: Text('Início'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
              },
            ),

            ListTile(
              title: Text('Cadastrar Espaços'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => CreatePlace()));
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
                isloggedin = false;
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
                color: Colors.orange,
              ),
            ),
            ListTile(
              title: Text('Início'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
              },
            ),

            ListTile(
              title: Text('Login'),
              onTap: () {
                          //Navigator.push(context, MaterialPageRoute(builder: (context) => sucesspage(emailController.text)));
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));

              },
            ),
            ListTile(
              title: Text('Cadastrar'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => registerpage()));
              },
            ),
          ],
        ),
      );

}