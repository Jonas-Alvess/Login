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
      margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
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
        child: Container(
          height: 350,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: NetworkImage(
                      widget.media['image'],
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Visibility(
                  visible: widget.media['type'] == 'video',
                  child: Icon(
                    Icons.play_circle_fill_rounded,
                    size: 100,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  widget.media['title'],
                  style: TextStyle(fontSize: 17),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(widget.media['description']),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
