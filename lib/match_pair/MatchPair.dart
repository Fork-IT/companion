import 'package:flutter/material.dart';

import 'item_model.dart';

class MatchPair extends StatefulWidget {
  const MatchPair({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<MatchPair> {
  late List<ItemModel> items;
  late List<ItemModel> items2;
  late int score;
  late bool gameOver;

  initGame() {
    gameOver = false;
    score = 0;
    items = [
      ItemModel(value: 'Fruit', name: 'Fruit', img: 'assets/images/apl.png'),
      ItemModel(value: 'Radio', name: 'Radio', img: 'assets/images/radio.png'),
      ItemModel(value: 'News Paper', name: 'News Paper', img: 'assets/images/news.png'),
      ItemModel(value: 'Medicines', name: 'Medicines', img: 'assets/images/medicine.png'),
      ItemModel(value: 'Eye Glass', name: 'Eye Glass', img: 'assets/images/spcs.png'),
      ItemModel(value: 'Walk Stick', name: 'Walk Stick', img: 'assets/images/walkingstick.png'),
      ItemModel(value: 'Television', name: 'Television', img: 'assets/images/tv.png'),
      ItemModel(value: 'Cards', name: 'Cards', img: 'assets/images/card.png'),
      ItemModel(value: 'Hand Wash', name: 'Hand Wash', img: 'assets/images/handwash.png'),
    ];
    items2 = List<ItemModel>.from(items);

    items.shuffle();
    items2.shuffle();
  }

  @override
  void initState() {
    super.initState();
    initGame();
  }

  @override
  Widget build(BuildContext context) {
    if (items.length == 0) gameOver = true;
    return Scaffold(
      body: Container(
        height: 1000,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.orange[500]!,
              Colors.yellow[900]!,
              Colors.blueAccent[100]!,
              Colors.blueGrey[900]!,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey[100]
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Score : ',
                            style: Theme.of(context).textTheme.headline3,
                          ),
                          TextSpan(
                            text: '$score',
                            style: Theme.of(context)
                                .textTheme
                                .headline3!
                                .copyWith(color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                if (!gameOver)
                  Row(
                    children: [
                      Spacer(),
                      Column(
                        children: items.map((item) {return Container(
                          margin: EdgeInsets.all(8),
                          child: Draggable<ItemModel>(
                            data: item,
                            childWhenDragging: Container(
                              height: 100,
                              child: Image.asset(item.img!),
                            ),
                            feedback: Container(
                              height: 100,
                              child: Image.asset(item.img!),
                            ),
                            child: Container(
                              height: 70,
                              child: Image.asset(item.img!),
                            ),
                          ),
                        );
                        }).toList(),
                      ),
                      const Spacer(flex: 2),
                      Column(
                        children: items2.map((item) {
                          return DragTarget<ItemModel>(
                            onAccept: (receivedItem) {
                              if (item.value == receivedItem.value) {
                                setState(() {
                                  items.remove(receivedItem);
                                  items2.remove(item);
                                });
                                score += 10;
                                item.accepting = false;

                                //player.play('true.wav');
                              } else {
                                setState(() {
                                  score -= 5;
                                  item.accepting = false;
                                  //player.play('false.wav');
                                });
                              }
                            },
                            onWillAccept: (receivedItem) {
                              setState(() {
                                item.accepting = true;
                              });
                              return true;
                            },
                            onLeave: (receivedItem) {
                              setState(() {
                                item.accepting = false;
                              });
                            },
                            builder: (context, acceptedItems, rejectedItems) =>
                                Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40),
                                      color: item.accepting
                                          ? Colors.yellow[500]
                                          : Colors.brown[100],
                                    ),
                                    alignment: Alignment.center,
                                    height:
                                    MediaQuery.of(context).size.width / 6.5,
                                    width: MediaQuery.of(context).size.width / 3,
                                    margin: const EdgeInsets.all(12),
                                    child: Text(
                                      item.name!,
                                      style:const TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold
                                      ),
                                    )),
                          );
                        }).toList(),
                      ),
                      Spacer(),
                    ],
                  ),
                if (gameOver)
                  Center(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '\nGame Over !!',
                            style: Theme.of(context).textTheme.headline6!.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                            fontFamily: "DynaPuff",
                              fontSize: 28
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            result(),
                            style: Theme.of(context).textTheme.headline3,
                          ),
                        ),
                      ],
                    ),
                  ),
                if (gameOver)
                  Container(
                    height: MediaQuery.of(context).size.width / 10,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(8)),
                    child: TextButton(
                        onPressed: () {
                          setState(() {
                            initGame();
                          });
                        },
                        child: Text(
                          'Play Again',
                          style: TextStyle(color: Colors.white),
                        )),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }

  //functions calls here

  String result() {
    if (score >= 80) {
      return '\t\t\t\t\t\t\t\t\t\t\t\t😍\nAwesome !!\nyou did great job';
    } else {
      return 'You Did Well !! Play Again to perform even better ';
    }
  }
}