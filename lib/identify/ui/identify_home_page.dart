import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import '../controllers/identify_task_controller.dart';
import '../models/identify_task.dart';
import '../widgets/identify_buttons.dart';
import '../widgets/identify_task_tile.dart';
import 'identify_add_task_bar.dart';
import 'identify_theme.dart';

class IdentifyHomePage extends StatefulWidget {
  const IdentifyHomePage({Key? key}) : super(key : key);

  @override
  _IdentifyHomePageState createState() => _IdentifyHomePageState();
}

class _IdentifyHomePageState extends State<IdentifyHomePage> {
  final _taskController = Get.put(IdentifyTaskController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add image of your loved once'),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IdentifyMyButton(label: "+ Add Image", onTap: ()async{
                  await Get.to(()=>const IdentifyAddTaskPage());
                  _taskController.getTasks();
                }
                )
              ],
            ),
          ),
          const SizedBox(height: 10,),
          const Text(
            "Tap to view\nLong press to delete",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
          const Divider(color: Colors.black, thickness: 2,),
          const SizedBox(height: 10,),
          _showTasks()
        ],
      )
    );
  }

  _showTasks() {
    return Expanded(
      child: Obx((){
        if(_taskController.taskList.isEmpty)
        {
          return const Center(
            child: Text(
              "NO DATA",
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          );
        }
        else {
          return ListView.builder(
              itemCount: _taskController.taskList.length,

              itemBuilder: (_, index) {
                IdentifyTask task = _taskController.taskList[index];
                return AnimationConfiguration.staggeredList(
                    position: index,
                    child: SlideAnimation(
                      child: FadeInAnimation(
                        child: Row(
                          children: [
                            GestureDetector(
                              onLongPress: () {
                                _showBottomSheet(context, task);
                              },
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (ctx) =>
                                      AlertDialog(
                                        title: Text(
                                          "Name : ${task.name ??
                                              ""}\nRelation : ${task.relation ??
                                              ""}",
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(ctx).pop();
                                            },
                                            child: const Text("Ok"),
                                          ),
                                        ],
                                      ),
                                );
                              },
                              child: IdentifyTaskTile(task),
                            )
                          ],
                        ),
                      ),
                    )
                );
              });
        }
      }),
    );
  }

  _showBottomSheet(BuildContext context, IdentifyTask task) {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.only(top: 4),
        height: MediaQuery.of(context).size.height*0.15,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              height: 6,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[300],
              ),
            ),
            _bottomSheetButton(
                label: "Delete File",
                onTap: () {
                  _taskController.delete(task);
                  Get.back();
                },
                clr: Colors.red[300]!,
                context:context
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      )
    );
  }

  _bottomSheetButton({
    required String label,
    required Function()? onTap,
    required Color clr,
    bool isClose=false,
    required BuildContext context
}) {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 4),
          height: 55,
          width: MediaQuery.of(context).size.width*0.9,
          decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: isClose==true?Colors.grey[300]!:clr
            ),
            borderRadius: BorderRadius.circular(20),
            color: isClose==true?Colors.transparent:clr,
          ),
          child: Center(
            child: Text(
              label,
              style: isClose?titleStyle:titleStyle.copyWith(color: Colors.white),
            ),
          ),
        ),
      );
   }
}