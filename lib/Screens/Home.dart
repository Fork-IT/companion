import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:finaltwo/Screens/Startup.dart';
import 'package:finaltwo/model/model.dart';
import 'package:finaltwo/services/localdb.dart';
import 'package:finaltwo/services/yogadb.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _textAnimationController;

  bool isLoading = true;
  late List<YogaSummary> yogasumlst;
  Future readYogaSumEntry() async {
    yogasumlst = await YogaDatabase.instance.readAllYogaSum();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 0));
    _textAnimationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 0));
    super.initState();
    GetFitnessData();


    readYogaSumEntry();
  }

  int? streak;
  int? kcal;
  int? womin;
  void GetFitnessData() async {
    streak = await LocalDB.getStreak();
    kcal = await LocalDB.getKcal();
    womin = await LocalDB.getWorkOutTime();

    print(await LocalDB.getLastDoneOn());
    setState(() {});
  }

  bool scrollListner(ScrollNotification scrollNotification) {
    bool scroll = false;
    if (scrollNotification.metrics.axis == Axis.vertical) {
      _animationController.animateTo(scrollNotification.metrics.pixels / 80);
      _textAnimationController.animateTo(scrollNotification.metrics.pixels);
      return scroll = true;
    }
    return scroll;
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Scaffold(body: Center())
        : Scaffold(
      appBar: AppBar(
        title: Text('Exercise Zone'),
        backgroundColor: Colors.blue[500]!,
      ),
            key: scaffoldKey,
            backgroundColor: Colors.white,
            body: NotificationListener(
              onNotification: scrollListner,
              child: Stack(
                children: [
                  Container(
                    height: double.infinity,
                    child: Stack(
                      children: [
                        SingleChildScrollView(
                          child: Stack(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.all(20),
                                    child: Column(
                                      children: [
                                        Container(
                                            padding:
                                                const EdgeInsets.only(bottom: 80),
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: const Text(
                                              "YOGA SE HI HOGA (STAY HEALTHY)",
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            )),

                                        ListView.builder(
                                            shrinkWrap: true,
                                            itemCount: yogasumlst.length,
                                            itemBuilder: (context, index) {
                                              return InkWell(
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) => Startup(
                                                              yogaSum:
                                                                  yogasumlst[
                                                                      index],
                                                              Yogakey: yogasumlst[
                                                                      index]
                                                                  .yogakey
                                                                  .toString())));
                                                },
                                                child: Container(
                                                  margin: const EdgeInsets.only(
                                                      bottom: 20),
                                                  child: Stack(
                                                    children: [
                                                      Container(
                                                        height: 150,
                                                        decoration: BoxDecoration(
                                                            image: DecorationImage(
                                                                fit: BoxFit
                                                                    .cover,
                                                                image: AssetImage(
                                                                    yogasumlst[
                                                                            index]
                                                                        .BackImg
                                                                        .toString()))),
                                                      ),
                                                      Container(
                                                        height: 150,
                                                        color: Colors.black26,
                                                      ),
                                                      Positioned(
                                                        right: 20,
                                                        left: 10,
                                                        top: 10,
                                                        child: Text(
                                                          yogasumlst[index]
                                                              .YogaWorkOutName,
                                                          style: const TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 18),
                                                        ),
                                                      ),
                                                      Positioned(
                                                        right: 30,
                                                        left: 12,
                                                        top: 38,
                                                        child: Text("${yogasumlst[index]
                                                            .TimeTaken} Minutes || ${yogasumlst[index]
                                                            .TotalNoOfWork} Workouts"
                                                           ,
                                                          style: const TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 10),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              );
                                            }),


                                        Container(
                                          width: MediaQuery.of(context).size.width,
                                          padding: const EdgeInsets.symmetric(vertical: 20),
                                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10) , color: Colors.blueGrey),

                                          child: Column(

                                            children: [
                                              const Text("YOGA SE HI HOGA " , style: TextStyle(fontSize: 22 , fontWeight: FontWeight.bold,color: Colors.white),),
                                              const Text("Yoga has been called one of the best forms of exercise for older adults." , style: const TextStyle(fontWeight: FontWeight.w300 , fontSize: 15 ,color: Colors.white),),
                                              const Text("Do Yoga & Remain Fit " , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold,color: Colors.white),),
                                              const Text("Yoga is safe, it can reduce stress levels, and it’s good for mental health. Yoga is essential to keep us healthy physically and maintain an overall positive attitude." , style: TextStyle(fontSize: 15 , fontWeight: FontWeight.w300,color: Colors.white),)
                                            ],
                                          )
                                        )
                                        // InkWell(
                                        //   onTap: (){
                                        //
                                        //   },
                                        //   child: Container(
                                        //     margin: EdgeInsets.only(bottom: 20),
                                        //     child: Stack(
                                        //       children: [
                                        //         Container(
                                        //           height: 150,
                                        //           decoration: BoxDecoration(
                                        //               image: DecorationImage(
                                        //                   fit: BoxFit.cover,
                                        //                   image: NetworkImage(
                                        //                       "https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=920&q=80"))),
                                        //         ),
                                        //         Container(
                                        //           height: 150,
                                        //           color: Colors.black26,
                                        //         ),
                                        //         Positioned(
                                        //           right: 20,
                                        //           left: 10,
                                        //           top: 10,
                                        //           child: Text(
                                        //             "Yoga For Begineers",
                                        //             style: TextStyle(
                                        //                 color: Colors.white,
                                        //                 fontWeight: FontWeight.bold,
                                        //                 fontSize: 18),
                                        //           ),
                                        //         ),
                                        //         Positioned(
                                        //           right: 30,
                                        //           left: 12,
                                        //           top: 38,
                                        //           child: Text(
                                        //             "Last Time : 2 Feb",
                                        //             style: TextStyle(
                                        //                 color: Colors.white,
                                        //                 fontSize: 10),
                                        //           ),
                                        //         )
                                        //       ],
                                        //     ),
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
  }
}
