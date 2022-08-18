import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Breathing extends StatefulWidget {
  @override
  ExercisePageScreen createState() => ExercisePageScreen();
}

class ExercisePageScreen extends State<Breathing> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Breathing Exercise"),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.orange[500]!,
              Colors.pink[200]!,
              Colors.yellow[100]!,
              Colors.green[500]!,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        //color: Colors.teal,
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(15),
          children: [
            Card(
              child: YoutubePlayer(
                controller:YoutubePlayerController(
                  initialVideoId:YoutubePlayer.convertUrlToId("https://www.youtube.com/watch?v=EhUfVa6jnVI")!,
                  flags: YoutubePlayerFlags(
                    showLiveFullscreenButton: true,
                    enableCaption: false,
                    autoPlay: false,
                  ),
                ),
              ),
            ),
            Text('\n➡ Improving muscle function during exercises and preventing strain.\n',
              style: TextStyle(
                  color: Colors.blue.shade900,
                  fontSize: 19,
                  fontFamily: "Merriweather"
              ),
              textAlign: TextAlign.center,),
            Card(
              child: YoutubePlayer(
                controller:YoutubePlayerController(
                  initialVideoId:YoutubePlayer.convertUrlToId("https://www.youtube.com/watch?v=n2UIqQ33vOM")!,
                  flags: YoutubePlayerFlags(
                    enableCaption: false,
                    autoPlay: false,
                  ),
                ),
              ),
            ),
            Text('\n➡ Helping you relax | Reducing blood pressure\n',
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
                  initialVideoId:YoutubePlayer.convertUrlToId("https://www.youtube.com/watch?v=9C9fSaqjNFw")!,
                  flags: YoutubePlayerFlags(
                    enableCaption: false,
                    autoPlay: false,
                  ),
                ),
              ),
            ),
            Text('\n➡ Making it easier for your body to release gas waste from your lungs.\n',
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