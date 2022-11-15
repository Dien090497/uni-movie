import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoDetailMovieWidget extends StatefulWidget {
  final String url;
  const VideoDetailMovieWidget({Key? key, required this.url}) : super(key: key);

  @override
  State<VideoDetailMovieWidget> createState() => _VideoDetailMovieWidgetState();
}

class _VideoDetailMovieWidgetState extends State<VideoDetailMovieWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        widget.url)
      ..initialize().then((_) {
        setState(() {
          _controller.play();
        });
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _controller.value.isInitialized ? AspectRatio(
        aspectRatio: _controller.value.aspectRatio,
        child: VideoPlayer(_controller),
      )
          : Container(),
    );
  }
}
