import 'package:flutter/material.dart';
import 'package:ratimbum2/network/login.dart';
import 'package:ratimbum2/register.dart';
import 'package:ratimbum2/sucesspage.dart';
import 'package:ratimbum2/model/globals.dart' as globals;


class LoginPage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<LoginPage> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    final emailfield = TextField(
      controller: emailController,
      obscureText: false,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
          focusColor: Colors.orange, 
          hoverColor: Colors.orange
        ),
    );

    final passwordField = TextField(obscureText: true,
        controller: passwordController,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
          focusColor: Colors.orange
        ),
    );

    final loginButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.orange,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: (){
          globals.isloggedin = true;
          loginhandler.sign_in(context, emailController.text, passwordController.text);
          //Navigator.push(context, MaterialPageRoute(builder: (context) => sucesspage(emailController.text)));
        },
        child: Text("Login", 
        textAlign: TextAlign.center,
        style: TextStyle(color: Color(0xfafafaff)),
        ),
      ),
    );



    return Scaffold(
      appBar: AppBar(
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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset('lib/assets/logo2.png', width: 140,),
                SizedBox(height: 70.0),
                emailfield,
                SizedBox(height: 25.0),
                passwordField, 
                SizedBox(height: 25.0),
                loginButton,
                SizedBox(height: 120.0),

              ],        
            ),
          ),
          )
        )
      ),
    //drawer: globals.selectdrawer(context)
    );
  }
}