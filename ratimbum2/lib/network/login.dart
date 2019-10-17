import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart' as toast;

class loginhandler{
  String email;


  static Future<int> register(BuildContext context, String email, String password, String passwordConfirmation) async {
    Map<String, String> headers = {"Content-type": "application/json"};
    String json = '{ "user": { "email": "'+email+'","password": "'+password+'", "password_confirmation": "'+passwordConfirmation+'"}}';
    print(json);

    var url = "https://ratimbum.herokuapp.com/auth/";
    var response = await http.post(url, headers: headers, body: json);
    print(response.statusCode);    
    print(response.body);
    toast.Toast.show(response.statusCode.toString(), context,duration: toast.Toast.LENGTH_SHORT, gravity: toast.Toast.BOTTOM);
  }

    static Future<int> sign_in(BuildContext context, String email, String password) async {
    Map<String, String> headers = {"Content-type": "application/json"};
    String json = '{ "user": { "email": "'+email+'","password": "'+password+'"}}';
    print(json);
    var url = "https://ratimbum.herokuapp.com/auth/sign_in";
    var response = await http.post(url, headers: headers, body: json);
    print(response.statusCode);    
    print(response.body);
    toast.Toast.show(response.statusCode.toString(), context,duration: toast.Toast.LENGTH_SHORT, gravity: toast.Toast.BOTTOM);
  }

}