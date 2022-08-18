// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';
//
// class ExercisePage extends StatefulWidget {
//   @override
//   ExercisePageScreen createState() => ExercisePageScreen();
// }
//
// class ExercisePageScreen extends State<ExercisePage> {
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Stay Healthy | Stay Fit"),
//         centerTitle: true,
//         backgroundColor: Colors.cyan,
//       ),
//       body: Container(
//         color: Colors.teal,
//         child: ListView(
//           scrollDirection: Axis.vertical,
//           padding: EdgeInsets.all(15),
//           children: [
//             Card(
//               child: YoutubePlayer(
//                 controller:YoutubePlayerController(
//                   initialVideoId:YoutubePlayer.convertUrlToId("https://youtu.be/-p0PA9Zt8zk")!,
//                   flags: YoutubePlayerFlags(
//                     showLiveFullscreenButton: true,
//                     enableCaption: false,
//                     autoPlay: false,
//                   ),
//                 ),
//               ),
//             ),
//             Card(
//               child: YoutubePlayer(
//                 controller:YoutubePlayerController(
//                   initialVideoId:YoutubePlayer.convertUrlToId("https://youtu.be/VecbXgWY0DI")!,
//                   flags: YoutubePlayerFlags(
//                     enableCaption: false,
//                     autoPlay: false,
//                   ),
//                 ),
//               ),
//             ),
//             Card(
//               child: YoutubePlayer(
//                 controller:YoutubePlayerController(
//                   initialVideoId:YoutubePlayer.convertUrlToId("https://youtu.be/_sNRH65Wmuw")!,
//                   flags: YoutubePlayerFlags(
//                     enableCaption: false,
//                     autoPlay: false,
//                   ),
//                 ),
//               ),
//             ),
//             Card(
//               child: YoutubePlayer(
//                 controller:YoutubePlayerController(
//                   initialVideoId:YoutubePlayer.convertUrlToId("https://youtu.be/cHp3JjnhUTc")!,
//                   flags: YoutubePlayerFlags(
//                     enableCaption: false,
//                     autoPlay: false,
//                   ),
//                 ),
//               ),
//             ),
//             Card(
//               child: YoutubePlayer(
//                 controller:YoutubePlayerController(
//                   initialVideoId:YoutubePlayer.convertUrlToId("https://youtu.be/NQmnJtB1gzo")!,
//                   flags: YoutubePlayerFlags(
//                     enableCaption: false,
//                     autoPlay: false,
//                   ),
//                 ),
//               ),
//             ),
//
//             Card(
//               child: YoutubePlayer(
//                 controller: YoutubePlayerController(
//                   initialVideoId: YoutubePlayer.convertUrlToId("https://youtu.be/t69IPkfC4vw")!,
//                   flags: YoutubePlayerFlags(
//                     enableCaption: false,
//                     autoPlay: false,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }