import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';


class MusicPage extends StatefulWidget {
  const MusicPage({Key? key}) : super(key: key);

  @override
  State<MusicPage> createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {

  final player = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;


  @override
  void initState() {
    setAudio();
    super.initState();

    player.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });

    player.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    player.onPositionChanged.listen((newPosition){
      setState(() {
        position = newPosition;
      });
    });

  }

  @override
  void dispose(){
    player.dispose();
    super.dispose();
  }

  String? time(Duration duration){
    String twoDigits(int n) => n.toString().padLeft(2,'0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return[
      if(duration.inHours > 0) hours,
      minutes,
      seconds,
    ].join(":");

  }

  Future setAudio() async{
    player.setReleaseMode(ReleaseMode.loop);
    final players = AudioCache(prefix: "assets/");
    final url = await players.load('delta_waves.mp3');
    //String url = "https://assets.mixkit.co/music/preview/mixkit-tech-house-vibes-130.mp3";
    player.setSourceUrl(url.path);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.cyan,
          elevation: 25,
          title: Text('Sleep Music Delta Waves') ,
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment:MainAxisAlignment.center ,
            children: [
              Image(image: AssetImage('assets/music.png'),width: 500, height: 250,),
              // Image.network("https://img.freepik.com/premium-vector/chakras-concept_23-2148570064.jpg?w=2000",
              //   width: double.infinity,
              //   height: 300,
              //   fit: BoxFit.cover,),
              SizedBox(height: 8,),
              Slider(
                min: 0,
                max: duration.inSeconds.toDouble(),
                value: position.inSeconds.toDouble(),
                onChanged: (value) async{
                  final position = Duration(seconds: value.toInt());
                  await player.seek(position);
                  await player.resume();
                },

              ),
              SizedBox(height:5 ,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Text(time(duration) ?? ""),
                    // Text(time(duration - position) ?? "")
                    Text(time(parseDuration("0") + position) ?? ""),
                    Text(time(duration) ?? "")
                  ],
                ),
              ),
              IconButton(
                onPressed: () async{
                  if(isPlaying){
                    await player.pause();
                    print(duration.runtimeType);
                  } else{
                    await player.resume();
                    //String url = "https://assets.mixkit.co/music/preview/mixkit-tech-house-vibes-130.mp3";
                  }
                },
                icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow,),
                iconSize: 70,
              )
            ],
          ),
        )
    );
  }
  Duration parseDuration(String s) {
    int hours = 0;
    int minutes = 0;
    int micros;
    List<String> parts = s.split(':');
    if (parts.length > 2) {
      hours = int.parse(parts[parts.length - 3]);
    }
    if (parts.length > 1) {
      minutes = int.parse(parts[parts.length - 2]);
    }
    micros = (double.parse(parts[parts.length - 1]) * 1000000).round();
    return Duration(hours: hours, minutes: minutes, microseconds: micros);
  }
}