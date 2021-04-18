//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen() : super();
  // final String title = "DiscorT";
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  VideoPlayerController _controller;
  // Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    //super.initState();
    _controller = VideoPlayerController.asset('assets/video/homepage.mp4')
      ..initialize().then((value) => {setState(() {})});
    // _initializeVideoPlayerFuture = _controller.initialize();

    _controller.setVolume(0.0);
    _controller.setLooping(true);
    _controller.play();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      //debugShowCheckedModeBanner: false,
      children: <Widget>[
        SizedBox.expand(
          child: FittedBox(
            fit: BoxFit.cover,
            child: SizedBox(
              width: 100,
              height: 100,
              child: VideoPlayer(_controller),
            ),
          ),
        ),
      ],
    );
  }
}