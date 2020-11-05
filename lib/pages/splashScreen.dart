import 'dart:async';
import 'package:json_store/json_store.dart';

import 'package:flutter/material.dart';
import '../Home.dart';
import 'MemberPage.dart';


class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StartState();

}

class StartState extends State<SplashScreen> {
  JsonStore jsonStore = JsonStore();
  @override
  Widget build(BuildContext context) {
    return initScreen(context);
  }

  @override
  void initState() {
    super.initState();
    startTimer();

    jsonStore.getItem('user').then((value) {
      if (value == null) {
        // enviar para tela de login
      } else {
        // Recupera os dados do usuário salvo no armazenamento local
        var datauser = value;

        if (datauser['level'] == 'admin') {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) =>
              Home(
                username: datauser['username'],
                id_usuario: datauser['id_usuario'],
              )));
        } else if (datauser['level'] == 'member') {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) =>
              MemberPage(
                username: datauser['username'],
                id_usuario: datauser['id_usuario'],
              )));
        }
      }
    });
  }
  startTimer() async {
    var duration = Duration(seconds: 3);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => Home()
    )
    );
  }

  initScreen(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.red[900],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Text(
              "Splash",
              style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            CircularProgressIndicator(
              backgroundColor: Colors.white,
              strokeWidth: 1,
            )
          ],
        ),
      ),
    );
  }
}