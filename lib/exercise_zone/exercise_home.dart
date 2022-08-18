import 'package:finaltwo/exercise_zone/standingexercise.dart';
import 'package:finaltwo/exercise_zone/suryanamashkar.dart';
import 'package:flutter/material.dart';
import 'breathing.dart';
import 'chairyoga.dart';



class ExerciseHome extends StatelessWidget {
  const ExerciseHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.cyan,
        elevation: 10,
        title: Text('Stay Healthy | Stay Fit') ,
      ),
      body: SingleChildScrollView(
        child: Container(
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
          child: Column(
            children: [
              Padding(
                padding:  const EdgeInsets.all(20.0),
                child: InkWell(
                  onTap: (){
                    Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context)=>Surya()),
                    );
                  },
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    child: Padding(
                      padding:  const EdgeInsets.all(8.0),
                      child: Column(
                        children:  [
                          SizedBox(
                              height: 150,
                              child: Image.asset('assets/images/surya.png',)
                          ),
                          const Spacer(),
                          const Text(
                            'Surya Namaskar',
                            style: TextStyle(
                                color: Colors.deepOrange,
                                fontSize: 18,
                                fontWeight: FontWeight.w600
                            ),
                          )
                        ],
                      ),
                    ),
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(15)
                    ),
                  ),
                ),
              ),

              Padding(
                padding:  const EdgeInsets.all(20.0),
                child: InkWell(
                  onTap: (){
                    Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context)=> ChairYoga()),
                    );
                  },
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    child: Padding(
                      padding:  const EdgeInsets.all(8.0),
                      child: Column(
                        children:  [
                          SizedBox(
                              height: 150,
                              child: Image.asset('assets/images/chairyoga.png',)
                          ),
                          const Spacer(),
                          const Text(
                            'Chair Yoga',
                            style: TextStyle(
                                color: Colors.pinkAccent,
                                fontSize: 18,
                                fontWeight: FontWeight.w600
                            ),
                          )
                        ],
                      ),
                    ),
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(15)
                    ),
                  ),
                ),
              ),
              Padding(
                padding:  const EdgeInsets.all(20.0),
                child: InkWell(
                  onTap: (){
                    Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context)=> Standing()),
                    );
                  },
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    child: Padding(
                      padding:  const EdgeInsets.all(8.0),
                      child: Column(
                        children:  [
                          SizedBox(
                              height: 150,
                              child: Image.asset('assets/images/aerobics.png',)

                          ),
                          const Spacer(),
                          const Text(
                            'Standing Exercises',
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 18,
                                fontWeight: FontWeight.w600
                            ),

                          )
                        ],
                      ),
                    ),
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(15)

                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: InkWell(
                  onTap: (){
                    Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context)=> Breathing()),
                    );
                  },
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    child: Padding(
                      padding:  const EdgeInsets.all(8.0),
                      child: Column(
                        children:  [
                          SizedBox(
                              height: 150,
                              child: Image.asset('assets/images/breath.png',)

                          ),
                          const Spacer(),
                          const Text(
                            'Breathing Exercises',
                            style: TextStyle(
                                color: Colors.brown,
                                fontSize: 18,
                                fontWeight: FontWeight.w600
                            ),
                          )
                        ],
                      ),
                    ),
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(15)

                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}