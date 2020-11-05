import 'package:awsome_video_player/awsome_video_player.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class A extends StatefulWidget {
  final Map<String, dynamic> media;

  const A({Key key, this.media}) : super(key: key);

  @override
  _AState createState() => _AState();
}

class _AState extends State<A> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              widget.media['type'] == 'video'
                  ? AwsomeVideoPlayer(
                      widget.media['link'],
                    )
                  : CachedNetworkImage(
                      imageUrl: widget.media['image'],
                      width: 350,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
              // titulo
              Visibility(
                visible: widget.media['type'] == 'imagem',
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.media['title'],
                    style: TextStyle(fontSize: 17, color: Colors.black),
                  ),
                ),
              ),
              Visibility(
                visible: widget.media['type'] == 'imagem',
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.media['historia'],
                    style: TextStyle(fontSize: 17, color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
