import 'package:flutter/material.dart';

class MemberPage extends StatelessWidget {

  final String username;
  final String id_usuario;

  const MemberPage({Key key, this.username, this.id_usuario}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Welcome Member"),),
      body: Column(
        children: <Widget>[
          new Padding(padding: EdgeInsets.only(top: 40.0)),
          Center(child: Text('Hello $username', style: TextStyle(fontSize: 20.0),)),

          new Padding(padding: EdgeInsets.only(top: 40.0)),
//          Text('Hello $username', style: TextStyle(fontSize: 20.0),),

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