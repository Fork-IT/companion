import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Surya extends StatefulWidget {
  @override
  ExercisePageScreen createState() => ExercisePageScreen();
}

class ExercisePageScreen extends State<Surya> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Surya Namaskar"),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.orange[200]!,
              Colors.pink[200]!,
              Colors.yellow[100]!,
              Colors.green[400]!,
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
                  initialVideoId:YoutubePlayer.convertUrlToId("https://www.youtube.com/watch?v=1xRX1MuoImw")!,
                  flags: YoutubePlayerFlags(
                    showLiveFullscreenButton: true,
                    enableCaption: false,
                    autoPlay: false,
                  ),
                ),
              ),
            ),
            Text('\n➡ It improves the blood circulation of all the important organs of the body.\n',
            style: TextStyle(
              color: Colors.blue.shade900,
              fontSize: 19,
              fontFamily: "Merriweather"
            ),
            textAlign: TextAlign.center,),
            Card(
              child: YoutubePlayer(
                controller:YoutubePlayerController(
                  initialVideoId:YoutubePlayer.convertUrlToId("https://www.youtube.com/watch?v=PC7ctYaQ17E")!,
                  flags: YoutubePlayerFlags(
                    enableCaption: false,
                    autoPlay: false,
                  ),
                ),
              ),
            ),
            Text('\n➡ Improves the functioning of the heart and lungs.\n',
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
                  initialVideoId:YoutubePlayer.convertUrlToId("https://www.youtube.com/watch?v=LE-BL7WvUfk")!,
                  flags: YoutubePlayerFlags(
                    enableCaption: false,
                    autoPlay: false,
                  ),
                ),
              ),
            ),
            Text('\n➡ Strengthens the muscles of the arms and waist.\n',
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