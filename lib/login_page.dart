import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:list2/register.dart';
import 'dart:async';
import 'dart:convert';
import 'Home.dart';
import 'pages/MemberPage.dart';
import 'package:json_store/json_store.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController users = new TextEditingController();
  TextEditingController pass = new TextEditingController();
  // Plugin de armazenamento local
  JsonStore jsonStore = JsonStore();

  String msg = '';

  String username = '';
  String id_usuario = '';



  Future<List> _login() async {
    final response =
    await http.post("http://jcatechnology.com.br/ss/login.php", body: {
      "username": users.text,
      "password": pass.text,
      //"id":id,
    });

    var datauser = json.decode(response.body);
    /* var datauser = [
      {
        'level': 'admin',
        'username': 'firmino',
        'id_usuario': '12'
      }
    ];*/

    if (datauser.length == 0) {
      setState(() {
        msg = "Login Fail";
      });
    } else {
      if (datauser[0]['level'] == 'admin') {
        // Navigator.pushReplacementNamed(context, '/Home');
        Navigator.push(context, MaterialPageRoute(builder: (_) => Home()));
      } else if (datauser[0]['level'] == 'member') {
        // Navigator.pushReplacementNamed(context, '/MemberPage');
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => MemberPage()));
      }
      // Salvar os dados do usuario no local
      await jsonStore.setItem('user', datauser[0]);

      setState(() {
        username = datauser[0]['username'];
        id_usuario = datauser[0]['id_usuario'];
      });
    }

    return datauser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.red[900],
        //appBar: AppBar(title: Text("Login"),),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(top: 70, left: 30, right: 30),
          child: Column(
            children: <Widget>[
              new Padding(padding: EdgeInsets.only(top: 50.0)),
              Container(
                height: 200,
                width: 200,
                child: CircleAvatar(
                  backgroundImage: AssetImage("imagens/ss.png"

                  ),
                ),
              ),
              new TextFormField(
                controller: users,
                decoration: new InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(color: Colors.white)),
                  labelText: "Usuário",
                  prefixIcon: const Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  fillColor: Colors.black,
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                    borderSide: new BorderSide(color: Colors.white),
                  ),
                  //fillColor: Colors.green
                ),
                keyboardType: TextInputType.emailAddress,
                style: new TextStyle(
                  fontFamily: "Poppins",
                  color: Colors.black,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
//                child: Text('Hello World!'),
              ),
              new TextFormField(
                controller: pass,
                obscureText: true,
                decoration: new InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(color: Colors.white)),
                  labelText: "Senha",
                  prefixIcon: const Icon(
                    Icons.remove_red_eye,
                    color: Colors.white,
                  ),
                  fillColor: Colors.black,
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                    borderSide: new BorderSide(),
                  ),
                  //fillColor: Colors.green
                ),
                style: new TextStyle(
                  fontFamily: "Poppins",
                  color: Colors.black,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(12.0),
//                child: Text('Hello World!'),
              ),
              RaisedButton(
                child: Text("Login",
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                color: Colors.yellow[800],
                padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32)),
                onPressed: () {
                  _login();
                },
              ),
              SizedBox(
                height: 3,
              ),
              RaisedButton(
                child: Text(
                  "Cadastrar",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                color: Colors.yellow[800],
                padding: EdgeInsets.fromLTRB(25, 5, 25, 5),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Register(),
                    ),
                  );
                },
              ),
              Text(
                msg,
                style: TextStyle(fontSize: 20.0, color: Colors.red),
              )
            ],
          ),
        ));
  }

  Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }
}