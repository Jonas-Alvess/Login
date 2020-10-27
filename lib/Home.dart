import 'dart:convert';
import 'package:flutter/material.dart';
import 'list_card_ui.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {

  final String username;
  final String id_usuario;

  const Home({Key key, this.username, this.id_usuario}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List playlists = [];


  @override
  void initState() {
    super.initState();

    http.get('http://192.168.1.146/video/video.php').then((value) {
      List<dynamic> response = jsonDecode(value.body);

      setState(() {
        // atualiza a variael que está linkada na interface
        playlists = response;
      });
    }).catchError((err) {
      print(err);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[600],
      /*appBar: AppBar(
        title: Text('YouTube API'),
      ),*/
      body: SingleChildScrollView(
        child: Column(
          children: [
            /*SizedBox(
              height: 5,
            ),*/
            ListCardUi(
              items: playlists,
            ),
          ],
        ),
      ),
    );
  }
}
