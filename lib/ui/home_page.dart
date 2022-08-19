import 'package:finaltwo/controllers/task_controller.dart';
import 'package:finaltwo/ui/add_task_bar.dart';
import 'package:finaltwo/ui/theme.dart';
import 'package:finaltwo/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import '../models/task.dart';
import '../widgets/task_tile.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key : key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _taskController = Get.put(TaskController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Connect with your loved ones'),
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
                  MyButton(label: "+ Add Contact", onTap: ()async{
                    await Get.to(()=>AddTaskPage());
                    _taskController.getTasks();
                  }
                  )
                ],
              ),
            ),
            SizedBox(height: 10,),
            Container(
              child: Text(
                "Tap to call\nLong press to delete",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Divider(color: Colors.black, thickness: 2,),
            SizedBox(height: 12,),
            _showTasks(),
          ],
        )
    );
  }

  _showTasks() {
      return Expanded(
        child: Obx(() {
          if(_taskController.taskList.length == 0)
          {
            return Container(
              child: Center(
                child: Text(
                    "NO DATA",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                ),
              ),
            );
          }
          else {
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
                                onLongPress: () {
                                  _showBottomSheet(context, task);
                                },
                                onTap: () {
                                  FlutterPhoneDirectCaller.callNumber(
                                      task.number.toString());
                                },
                                child: TaskTile(task),
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

  _showBottomSheet(BuildContext context, Task task) {
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
                  label: "Delete Contact",
                  onTap: () {
                    _taskController.delete(task);
                    Get.back();
                  },
                  clr: Colors.red[300]!,
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