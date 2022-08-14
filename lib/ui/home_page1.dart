import 'dart:math';

import 'package:finaltwo/controllers/task_controller1.dart';
import 'package:finaltwo/notification_service.dart';
import 'package:finaltwo/ui/add_task_bar1.dart';
import 'package:finaltwo/ui/theme1.dart';
import 'package:finaltwo/widgets/buttons1.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_widget/home_widget.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

import '../models/task1.dart';
import '../widgets/task_tile1.dart';




class HomePage1 extends StatefulWidget {
  const HomePage1({Key? key}) : super(key : key);

  @override
  _HomePage1State createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {
  final _taskController = Get.put(TaskController());
  DateTime _selectedDate = DateTime.now();
  var notifyHelper;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notifyHelper=NotifyHelper();
    notifyHelper.initializeNotification();
    notifyHelper.requestIOSPermissions();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(DateFormat.yMMMMd().format(DateTime.now()),
                        style: subHeadingStyle,
                      ),
                      Text("Today",
                        style: headingStyle,
                      ),
                    ],
                )
                ),
                //MyButton(label: "+ Add Task", onTap: ()=>Get.to(()=>AddTaskPage()))
                MyButton(label: "+ Add Task", onTap: ()async{
                  await Get.to(()=>AddTaskPage());
                  // notifyHelper.displayNotification(
                  //   title:"Task successfully created",
                  //   body:"Your True Buddy is with you!",
                  // );
                  // notifyHelper.scheduledNotification();
                  _taskController.getTasks();
                }
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20, left: 20),
            child: DatePicker(
              DateTime.now(),
              height: 100,
              width: 80,
              initialSelectedDate: DateTime.now(),
              selectionColor: primaryClr,
              selectedTextColor: Colors.white,
              dateTextStyle: GoogleFonts.lato(
                textStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
              ),
              dayTextStyle: GoogleFonts.lato(
                textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
              ),
              monthTextStyle: GoogleFonts.lato(
                textStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
              ),
              onDateChange: (date) {
                setState(() {
                  _selectedDate = date;
                });
              },
            )
          ),
          SizedBox(height: 10,),
          _showTasks()
        ],
      )
    );
  }

  _showTasks() {
    return Expanded(
      child: Obx((){
        return ListView.builder(
            itemCount: _taskController.taskList.length,

            itemBuilder: (_, index) {
              Task task = _taskController.taskList[index];
              if(task.repeat=='Daily')
                {
                  DateTime date = DateFormat.jm().parse(task.startTime.toString());
                  var myTime = DateFormat("HH:mm").format(date);
                  print(myTime);
                  notifyHelper.scheduledNotification(
                    int.parse(myTime.toString().split(":")[0]),
                    int.parse(myTime.toString().split(":")[1]),
                    task
                  );
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
                                child: TaskTile(task),
                              )
                            ],
                          ),
                        ),
                      )
                  );
                }
              if(task.date==DateFormat.yMd().format(_selectedDate)) {
                DateTime date = DateFormat.jm().parse(task.startTime.toString());
                var myTime = DateFormat("HH:mm").format(date);
                notifyHelper.scheduledNotification(
                    int.parse(myTime.toString().split(":")[0]),
                    int.parse(myTime.toString().split(":")[1]),
                    task
                );
                print("this is the other if block");
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
                              child: TaskTile(task),
                            )
                          ],
                        ),
                      ),
                    )
                );
              }else {
                print("this is the else block");
                return Container();
              }
        });
      }),
    );
  }

  _showBottomSheet(BuildContext context, Task task) {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.only(top: 4),
        height: task.isCompleted==1?
        MediaQuery.of(context).size.height*0.24:
        MediaQuery.of(context).size.height*0.32,
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
            task.isCompleted==1
            ?Container()
                : _bottomSheetButton(
                label: "Task Completed",
                onTap: () async {
                  _taskController.markTaskCompleted(task.id!);
                  await notifyHelper.cancelNotification(task.id!);
                  Get.back();
                },
                clr: primaryClr,
                context:context
            ),
            _bottomSheetButton(
                label: "Delete Task",
                onTap: () async {
                  _taskController.delete(task);
                  await notifyHelper.cancelNotification(task.id!);
                  Get.back();
                },
                clr: Colors.red[300]!,
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

