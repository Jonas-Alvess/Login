import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class A extends StatefulWidget {
  final String username;
  final String id_usuario;
  final String historia;
  final String imagem;
  final String titulo;

  const A({Key key, this.username, this.id_usuario, this.historia, this.imagem, this.titulo}) : super(key: key);



  @override
  _AState createState() => _AState();
}

class _AState extends State<A> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child:Column(
          children: [
            CachedNetworkImage(
              imageUrl: widget.imagem,
              width: 350,
              fit: BoxFit.cover,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            // titulo
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.titulo,
                style: TextStyle(fontSize: 17, color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.historia,
                style: TextStyle(fontSize: 17, color: Colors.black),
              ),
            ),
          ],
        ),
      )
    );
  }
}
