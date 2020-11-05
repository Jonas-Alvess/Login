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
  VideoPlayerController _controller;

  double heightVideoCard = 280;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.network(widget.media['link'])
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
      });
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
        onTap: widget.media['type'] == 'image'
            ? () async {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => A(
              ),
            ),
          );
        } : null,
        child: Container(
          height: widget.media['type'] == 'video' ? heightVideoCard : null,
          child: Column(
            children: [
              widget.media['type'] == 'video'
                  ? AwsomeVideoPlayer(
                widget.media['link'],
                onfullscreen: (estaExpandido) {
                  if (estaExpandido)
                    setState(() {
                      heightVideoCard = 400;
                    });
                  else
                    setState(() {
                      heightVideoCard = 280;
                    });
                },
              )
                  : Image.network(
                widget.media['link'],
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
      ),
    );
  }
}