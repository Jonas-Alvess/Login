import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'login_page.dart';
import 'login_page.dart';
import 'main.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();

  Future register() async {
    var url = "http://jcatechnology.com.br/ss/register.php";
    var response = await http.post(url, body: {
      "username": user.text,
      "password": pass.text,
      "level": "member",
    });
    var data = json.decode(response.body);
    if (data == "Error") {
      /*FlutterToast(context).showToast(
          child: Text(
            'User allready exit!',
            style: TextStyle(fontSize: 25, color: Colors.red),
          ));*/
      Fluttertoast.showToast(
        msg: "Usuário já existe",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.red,
        fontSize: 20.0,
      );
    } else {
      /* FlutterToast(context).showToast(
          child: Text('Registration Successful',
              style: TextStyle(fontSize: 25, color: Colors.green)));*/
      Fluttertoast.showToast(
        msg: "Cadastro realizado com sucesso!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.red,
        fontSize: 20.0,
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MyHomePage(),
        ),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login SignUp',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        height: 300,
        child: Card(
          color: Colors.amber,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Register',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Username',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  controller: user,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  controller: pass,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                  color: Colors.pink,
                  child: Text('Register',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  onPressed: () {
                    register();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}