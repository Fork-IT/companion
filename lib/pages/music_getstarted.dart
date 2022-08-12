import 'package:finaltwo/pages/music_page.dart';
import 'package:flutter/material.dart';


class GetStart extends StatefulWidget {
  const GetStart({Key? key}) : super(key: key);

  @override
  State<GetStart> createState() => _GetStartState();
}

class _GetStartState extends State<GetStart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(top:100),
                    child: Text(
                      "Music Medicine",
                      style: TextStyle(
                        fontFamily: "DynaPuff",
                        color: Colors.blue,
                        fontSize: 40,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.symmetric(horizontal:32 ),
                  ),
                  Text(
                    "Getting set for a pleasant experience !!\n🤩",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Merriweather",
                      color: Colors.blue,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    "\nMake yourself comfortable and listen to the next audio for 5 minutes.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Merriweather",
                      color: Colors.red,
                      fontSize: 16,
                    ),
                  ),
                ],
              )
          ),
          Container(
            padding: EdgeInsets.symmetric(),
            child: Center(
              child: Image.asset("assets/meds.png"),
            ),
          ),
          Container(
            child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => MusicPage()),);
              },
              child: Container(
                margin: EdgeInsets.all(32),
                padding: EdgeInsets.all(20),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color(0xFFB40284A)
                ),
                child: Center(
                  child: Text(
                    "Get Started",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}