import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlay extends StatefulWidget {
  final String link;

  const VideoPlay({Key key, this.link}) : super(key: key);

  @override
  _VideoPlayState createState() => _VideoPlayState();
}

class _VideoPlayState extends State<VideoPlay> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.network(widget.link)
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video'),
      ),
      body: _controller.value.initialized
          ? Column(
        children: [
          Expanded(
            child: VideoPlayer(
              _controller,
            ),
          ),
          RaisedButton(
            onPressed: () {
              if (_controller.value.isPlaying) {
                _controller.pause();
              } else {
                _controller.play();
              }
              setState(() {});
            },
            child: Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
          ),
        ],
      )
          : Container(),
    );
  }
}