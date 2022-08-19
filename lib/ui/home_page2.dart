import 'package:finaltwo/controllers/task_controller2.dart';
import 'package:finaltwo/ui/add_task_bar2.dart';
import 'package:finaltwo/ui/current_location.dart';
import 'package:finaltwo/ui/theme2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import './get_location.dart';
import '../models/task2.dart';
import '../widgets/task_tile2.dart';
import 'add_task_bar2.dart';
import 'current_location.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({Key? key}) : super(key : key);

  @override
  _HomePage2State createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  final _taskController = Get.put(TaskController2());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your true buddy is with you !!'),
        centerTitle: true,
        elevation: 20,
        backgroundColor: Colors.cyan,
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    child: Text(
                        "+ Add Location".toUpperCase(),
                        style: TextStyle(fontSize: 14)
                    ),
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent),
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.blueAccent)
                          )
                      ),
                    ),
                    onPressed: ()async{
                      await Get.to(()=>AddTaskPage2());
                      _taskController.getTasks();
                      flag = false;
                    }
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20, left: 20),
          ),
          SizedBox(height: 10,),
          _showTasks()
        ],
      ),
    );
  }

  _showTasks() {
    return Expanded(
      child: Obx((){
        return ListView.builder(
            itemCount: _taskController.taskList.length,

            itemBuilder: (_, index) {
              Task task = _taskController.taskList[index];
                  return AnimationConfiguration.staggeredList(
                      position: index,
                      child: SlideAnimation(
                        child: FadeInAnimation(
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  _showBottomSheet(context, task);
                                },
                                child: TaskTile2(task),
                              )
                            ],
                          ),
                        ),
                      )
                  );
        });
      }),
    );
  }

  _showBottomSheet(BuildContext context, Task task) {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.only(top: 4),
        height: MediaQuery.of(context).size.height*0.32,
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
            Spacer(),
            _bottomSheetButton(
                label: "Show Direction",
                onTap: () async {
                  var title = task.title.toString();
                  var hmlat = task.lat!.toDouble();
                  var hmlan = task.lan!.toDouble();
                  HomeDirection().openMapsSheet(context,title,hmlat,hmlan);
                  Get.back();
                },
                clr: primaryClr,
                context:context
            ),
            _bottomSheetButton(
                label: "Delete Location",
                onTap: () async {
                  _taskController.delete(task);
                  Get.back();
                },
                clr: Colors.red[500]!,
                context:context
            ),
            SizedBox(
              height: 20,
            ),
            _bottomSheetButton(
                label: "Close",
                onTap: () {
                  Get.back();
                },
                clr: Colors.red[300]!,
                isClose: true,
                context:context
            ),
            SizedBox(
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

// ()async{
// await Get.to(()=>AddTaskPage());
// _taskController.getTasks();
// flag = false;
// }