import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';



class YoutubePlay extends StatefulWidget {
  final String url;

  const YoutubePlay({Key key, this.url}) : super(key: key);

  @override
  _YoutubePlayState createState() => _YoutubePlayState();
}

class _YoutubePlayState extends State<YoutubePlay> {
  YoutubePlayerController _controller;

  @override
  void initState() {
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.url),
      flags: YoutubePlayerFlags(
        autoPlay: true,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: _controller,
      showVideoProgressIndicator: true,
    );
  }
}
