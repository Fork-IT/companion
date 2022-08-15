// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:finaltwo/pages/quizpage.dart';
//
// class homepage extends StatefulWidget {
//   @override
//   _homepageState createState() => _homepageState();
// }
//
// class _homepageState extends State<homepage> {
//
//   List<String> images = [
//     "images/gk.png",
//     "images/sports.jpg",
//     "images/music.png",
//   ];
//
//   List<String> des = [
//     "A Lifetime of Knowledge Can Benefit Memory in Old Age !!",
//     " Sports Quiz\nJust Test Yourself !!",
//     " Test Yourself in the field of\n SA RE GA MA PA !!",
//   ];
//
//   Widget customcard(String langname, String image, String des){
//     return Padding(
//       padding: EdgeInsets.symmetric(
//         vertical: 20.0,
//         horizontal: 30.0,
//       ),
//       child: InkWell(
//         onTap: (){
//           Navigator.of(context).pushReplacement(MaterialPageRoute(
//             // in changelog 1 we will pass the langname name to ther other widget class
//             // this name will be used to open a particular JSON file
//             // for a particular language
//             builder: (context) => getjson(),
//           ));
//         },
//         child: Material(
//           color: Colors.cyan,
//           elevation: 10.0,
//           borderRadius: BorderRadius.circular(25.0),
//           child: Container(
//             child: Column(
//               children: <Widget>[
//                 Padding(
//                   padding: EdgeInsets.symmetric(
//                     vertical: 10.0,
//                   ),
//                   child: Material(
//                     elevation: 5.0,
//                     borderRadius: BorderRadius.circular(100.0),
//                     child: Container(
//                       // changing from 200 to 150 as to look better
//                       height: 150.0,
//                       width: 150.0,
//                       child: ClipOval(
//                         child: Image(
//                           fit: BoxFit.cover,
//                           image: AssetImage(
//                             image,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Center(
//                   child: Text(
//                     langname,
//                     style: TextStyle(
//                       fontSize: 20.0,
//                       color: Colors.white,
//                       fontFamily: "Quando",
//                       fontWeight: FontWeight.w700,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   padding: EdgeInsets.all(20.0),
//                   child: Text(
//                     des,
//                     style: TextStyle(
//                         fontSize: 18.0,
//                         color: Colors.white,
//                         fontFamily: "Alike"
//                     ),
//                     maxLines: 5,
//                     textAlign: TextAlign.justify,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setPreferredOrientations([
//       DeviceOrientation.portraitDown, DeviceOrientation.portraitUp
//     ]);
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.cyan,
//         elevation: 20,
//         centerTitle: true,
//         title: Text(
//           "Quick Quizzie",
//           style: TextStyle(
//             fontFamily: "Quando",
//           ),
//         ),
//       ),
//       body: ListView(
//         children: <Widget>[
//           customcard("General Knowledge", images[0], des[0]),
//           customcard("Sports", images[1], des[1]),
//           customcard("Music", images[2], des[2]),
//         ],
//       ),
//     );
//   }
// }