import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Standing extends StatefulWidget {
  @override
  ExercisePageScreen createState() => ExercisePageScreen();
}

class ExercisePageScreen extends State<Standing> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Standing Exercises"),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue[200]!,
              Colors.yellow[200]!,
              Colors.green[100]!,
              Colors.blue[200]!,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(15),
          children: [
            Card(
              child: YoutubePlayer(
                controller:YoutubePlayerController(
                  initialVideoId:YoutubePlayer.convertUrlToId("https://www.youtube.com/watch?v=mQLzNf8VOIc")!,
                  flags: YoutubePlayerFlags(
                    showLiveFullscreenButton: true,
                    enableCaption: false,
                    autoPlay: false,
                  ),
                ),
              ),
            ),
            Text('\n➡ Decreases the risk of heart-related diseases.\n',
              style: TextStyle(
                  color: Colors.blue.shade900,
                  fontSize: 19,
                  fontFamily: "Merriweather"
              ),
              textAlign: TextAlign.center,),
            Card(
              child: YoutubePlayer(
                controller:YoutubePlayerController(
                  initialVideoId:YoutubePlayer.convertUrlToId("https://www.youtube.com/watch?v=atMJ2opvCvo")!,
                  flags: YoutubePlayerFlags(
                    enableCaption: false,
                    autoPlay: false,
                  ),
                ),
              ),
            ),
            Text('\n➡ Brings relief in back pain.\n',
              style: TextStyle(
                  color: Colors.blue.shade900,
                  fontSize: 19,
                  fontFamily: "Merriweather"
              ),
              textAlign: TextAlign.center,
            ),
            Card(
              child: YoutubePlayer(
                controller:YoutubePlayerController(
                  initialVideoId:YoutubePlayer.convertUrlToId("https://www.youtube.com/watch?v=-btBxA9jVJo")!,
                  flags: YoutubePlayerFlags(
                    enableCaption: false,
                    autoPlay: false,
                  ),
                ),
              ),
            ),
            Text('\n➡ Reduces the risk of weight gain.\n',
              style: TextStyle(
                  color: Colors.blue.shade900,
                  fontSize: 19,
                  fontFamily: "Merriweather"
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}