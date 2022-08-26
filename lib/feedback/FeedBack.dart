import 'package:flutter/material.dart';
import 'package:reviews_slider/reviews_slider.dart';

void main() => runApp(FeedBack());

class FeedBack extends StatefulWidget {
  @override
  _FeedBackState createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
  late int selectedValue1=0;

  void onChange1(int value) {
    setState(() {
      selectedValue1 = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'How you feel today ?',
                style: TextStyle(color: Color(0xFF6f7478), fontSize: 18),
              ),
              SizedBox(height: 20),
              ReviewSlider(
                onChange: onChange1,
              ),
              Text(selectedValue1.toString()),
            ],
          ),
        ),
      ),
    );
  }
}