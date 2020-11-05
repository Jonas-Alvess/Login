import 'package:flutter/material.dart';

class AdminPage extends StatelessWidget {

  AdminPage({this.username, this.id_usuario});
  final String username;
  final String id_usuario;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Welcome Admin"),),
      body: Column(

        children: <Widget>[
          new Padding(padding: EdgeInsets.only(top: 40.0)),
          Center(child: Text('Hello $username', style: TextStyle(fontSize: 20.0),)),
          Center(child: Text('ID: $id_usuario', style: TextStyle(fontSize: 20.0),)),

          new Padding(padding: EdgeInsets.only(top: 40.0)),

          RaisedButton(
            child: Text("LogOut"),
            onPressed: (){
              Navigator.pushReplacementNamed(context,'/MyHomePage');
            },
          ),
        ],
      ),

    );
  }
}