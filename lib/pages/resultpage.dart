// import 'package:flutter/material.dart';
// import 'package:finaltwo/pages/home.dart';
//
// class resultpage extends StatefulWidget {
//   int marks;
//   resultpage({Key? key , required this.marks}) : super(key: key);
//
//   @override
//   State<resultpage> createState() => _resultpageState(marks);
// }
//
// class _resultpageState extends State<resultpage> {
//
//   List<String> images = [
//     "images/success.png",
//     "images/good.png",
//     "images/bad.png",
//   ];
//
//   late String image;
//   late String message;
//
//   void initState(){
//     if(marks <20) {
//       image = images [2];
//       message = "You should Try Hard..\n"+"You Scored $marks";
//     } else if(marks < 35){
//       image = images[1];
//       message = "You Can Do better..\n"+" You Scored $marks";
//     } else{
//       image = images[0];
//       message = "You Did Very Well..\n"+"You Scored $marks";
//     }
//     super.initState();
//   }
//
//   int marks;
//   _resultpageState(this.marks);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Result",
//         ),
//       ),
//       body: Column(
//         children: <Widget>[
//           Expanded(
//             flex: 7,
//             child: Material(
//               elevation: 10.0,
//               child: Container(
//                 child: Column(
//                   children: <Widget>[
//                     Material(
//                     child: Container(
//                       width: 300.0,
//                     height: 300.0,
//                     child: ClipRect(
//                       child: Image(
//                         image: AssetImage(
//                             image,),
//                        ),
//                       ),
//                      )
//                     ),
//                     Padding(
//                       padding: EdgeInsets.symmetric(
//                         vertical: 5.0,
//                         horizontal: 15.0,
//                       ),
//                       child:  Center(
//                         child: Text(
//                           message,
//                           style: TextStyle(
//                             fontSize: 20.0,
//                             fontFamily: "Quando",
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             flex: 4,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children:<Widget> [
//                 OutlinedButton(
//                   onPressed: (){
//                     Navigator.of(context).pushReplacement(MaterialPageRoute(
//                       builder: (context) => homepage(),
//                     ));
//                   },
//                   child: Text(
//                     style: TextStyle(
//                       fontSize: 18.0,
//                     ),
//                     "Continue"
//                   ),
//                   //borderSide: BorderSide(width: 3.0 , color: Colors.indigo),
//                 )
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
