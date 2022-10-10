import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Butter_Chicken extends StatefulWidget {
  @override
  State<Butter_Chicken> createState() => _Butter_ChickenState();
}

class _Butter_ChickenState extends State<Butter_Chicken> {
  final videoURL =
      "https://www.youtube.com/watch?v=a03U45jFxOI&t=4s&ab_channel=GetCurried";

  late YoutubePlayerController _controller;

  @override
  void initState() {
    final videoID = YoutubePlayer.convertUrlToId(videoURL);
    _controller = YoutubePlayerController(
      initialVideoId: videoID!,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        enableCaption: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFDD5353),
        title: const Text("Your Recipie!"),
      ),
      body: Column(
        children: [
          YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
            bottomActions: [
              CurrentPosition(),
              ProgressBar(),
              const PlaybackSpeedButton(),
            ],
          )
        ],
      ),
    );
  }
}
