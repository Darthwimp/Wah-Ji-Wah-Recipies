import 'package:flutter/material.dart'; //importing dependencies
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Butter_Chicken extends StatefulWidget {
  //creating a stateful widget for the youtubeplayer widget
  @override
  State<Butter_Chicken> createState() => _Butter_ChickenState();
}

class _Butter_ChickenState extends State<Butter_Chicken> {
  final videoURL =
      "https://www.youtube.com/watch?v=a03U45jFxOI&t=4s&ab_channel=GetCurried";

  late YoutubePlayerController _controller; //creating a youtubePlayercontroller

  @override
  void initState() //initializing the youtube controller
  {
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
        //the appbar of the page
        backgroundColor: Color(0xFFDD5353),
        title: const Text("Your Recipe!"),
      ),
      body: Column(
        children: [
          YoutubePlayer(
            //returning the youtubeplayer widget with all our customizations
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
