import 'package:awsome_video_player/awsome_video_player.dart';
import 'package:flutter/material.dart';
import 'package:list2/detail/a.dart';
import 'package:list2/pages/MemberPage.dart';
import 'package:video_player/video_player.dart';

class CardVideoImage extends StatefulWidget {
  final Map<String, dynamic> media;

  const CardVideoImage({
    Key key,
    this.media,
  }) : super(key: key);

  @override
  _CardVideoImageState createState() => _CardVideoImageState();
}

class _CardVideoImageState extends State<CardVideoImage> {
  double heightVideoCard = 280;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return antigo();
  }

  antigo() {
    return Card(
      margin: EdgeInsets.only(bottom: 50),
      
      elevation: 10,
      child: InkWell(
        onTap: () async {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => A(
                media: widget.media,
              ),
            ),
          );
        },
        child: Stack(
          children: [
            Container(
              height: 400,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.network(
                    widget.media['image'],
                    height: 300,
                  ),
                  Text(
                    widget.media['title'],
                    style: TextStyle(fontSize: 17),
                  ),
                  Text(widget.media['description']),
                ],
              ),
            ),
            Positioned(
              bottom: 150,
              left: MediaQuery.of(context).size.width / 2,
              child: Icon(
                Icons.play_circle_fill_rounded,
                size: 100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
