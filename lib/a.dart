import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class A extends StatefulWidget {

  @override
  _AState createState() => _AState();
}

class _AState extends State<A> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Text ("TELA A", style: TextStyle(color:Colors.black ),),
    );
  }
}
