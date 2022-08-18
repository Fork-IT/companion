import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ChairYoga extends StatefulWidget {
  @override
  ExercisePageScreen createState() => ExercisePageScreen();
}

class ExercisePageScreen extends State<ChairYoga> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chair Yoga"),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.lightGreen[600]!,
              Colors.amber[200]!,
              Colors.purple[200]!,
              Colors.deepOrange[100]!,
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
                  initialVideoId:YoutubePlayer.convertUrlToId("https://www.youtube.com/watch?v=n8_JcYAN7eU")!,
                  flags: YoutubePlayerFlags(
                    showLiveFullscreenButton: true,
                    enableCaption: false,
                    autoPlay: false,
                  ),
                ),
              ),
            ),
            Text('\n➡ Improve Your Posture.\n',
              style: TextStyle(
                  color: Colors.blue.shade900,
                  fontSize: 19,
                  fontFamily: "Merriweather"
              ),
              textAlign: TextAlign.center,),
            Card(
              child: YoutubePlayer(
                controller:YoutubePlayerController(
                  initialVideoId:YoutubePlayer.convertUrlToId("https://www.youtube.com/watch?v=SaYDK_LH_uk")!,
                  flags: YoutubePlayerFlags(
                    enableCaption: false,
                    autoPlay: false,
                  ),
                ),
              ),
            ),
            Text('\n➡ Strengthen Your Shoulders.\n',
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
                  initialVideoId:YoutubePlayer.convertUrlToId("https://www.youtube.com/watch?v=8BcPHWGQO44")!,
                  flags: YoutubePlayerFlags(
                    enableCaption: false,
                    autoPlay: false,
                  ),
                ),
              ),
            ),
            Text('\n➡ Increase Your Upper Body Flexibility.\n',
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