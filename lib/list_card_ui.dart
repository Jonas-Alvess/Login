import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'Home.dart';
import 'a.dart';

class ListCardUi extends StatefulWidget {
  final List items;
  final Axis direction;

  const ListCardUi(
      {Key key, @required this.items, this.direction = Axis.vertical})
      : super(key: key);

  @override
  _ListCardUiState createState() => _ListCardUiState();
}

class _ListCardUiState extends State<ListCardUi> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.red[50],
      height: 630,
      child: ListView.builder(
        scrollDirection: widget.direction,
        itemCount: widget.items.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.red[900],
            //color: Colors.purple[200],
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => A(
                      //url: widget.items[index]['link'],
                    ),
                  ),
                );
              },
              child: Container(
                child:
                Column(
                  children: [
                    // imagem
                    CachedNetworkImage(
                      imageUrl: widget.items[index]['image'],
                      width: 350,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                    // titulo
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.items[index]['title'],
                        style: TextStyle(fontSize: 17, color:Colors.white),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.items[index]['description'],
                        style: TextStyle(fontSize: 17, color:Colors.white),
                      ),
                    )
                  ],
                ),
              )
            ),
          );
        },
      ),
    );
  }
}

