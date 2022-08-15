import 'package:finaltwo/controllers/task_controller2.dart';
import 'package:finaltwo/ui/theme2.dart';
import 'package:finaltwo/widgets/buttons2.dart';
import 'package:finaltwo/widgets/input_field2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../models/task2.dart';
// import './get_direction.dart';
import './current_location.dart';

String? pointName;

class AddTaskPage2 extends StatefulWidget {
  const AddTaskPage2({Key? key}) : super(key: key);

  @override
  State<AddTaskPage2> createState() => _AddTaskPage2State();
}

class _AddTaskPage2State extends State<AddTaskPage2> {
  final TaskController2 _taskController = Get.put(TaskController2());
  final TextEditingController _titleController = TextEditingController();
  int _selectedColor = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add your location'),
        backgroundColor: Colors.cyan,
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20,top: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Add Location",
                style: TextStyle(
                    fontSize: 31,
                    fontFamily: "DynaPuff"),
              ),
              MyInputField2(
                title: "Title",
                hint: "Enter your title",
                controller: _titleController,
              ),
              SizedBox(height: 18),
              TextButton(
                  child: Text(
                      "Set Location".toUpperCase(),
                      style: TextStyle(
                        fontSize: 15,
                      fontFamily: "DynaPuff",
                      ),
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
                  onPressed: () {
                    pointName = _titleController.text;
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            CurrentLocationScreen()));
                  },
              ),
              SizedBox(height: 100,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Color",
                      style: TextStyle(
                        fontFamily: "DynaPuff"
                      ),
                      ),
                      SizedBox(height: 8.0,),
                      Wrap(
                        children: List<Widget>.generate(
                          3,
                            (int index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedColor = index;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: CircleAvatar(
                                  radius: 15,
                                  backgroundColor: index==0?primaryClr:index==1?pinkClr:yellowClr,
                                  child: _selectedColor==index?Icon(Icons.done,
                                  color: Colors.white,
                                  size: 16,
                                  ):Container(),
                                ),
                              ),
                            );
                            }
                        ),
                      )
                    ],
                  ),
                  ElevatedButton.icon(   // <-- ElevatedButton
                    onPressed: ()=>_validateData(),
                    icon: Icon(
                      Icons.done_outline_rounded,
                      size: 24.0,
                    ),
                    label: Text('SAVE LOCATION'),
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(200, 70),
                      elevation: 25,
                      textStyle: TextStyle(
                        fontSize: 16,
                        fontFamily: "DynaPuff"
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22), // <-- Radius
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ),
    );
  }

  _validateData(){
    if(_titleController.text.isNotEmpty && flag==true) {
      _addTaskToDb();
      Get.back();
    }
    else if(_titleController.text.isEmpty || flag==false){
      Get.snackbar("Required", "All fields are required !",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.white,
        colorText: pinkClr,
        icon: Icon(Icons.warning_amber_rounded,
        color: Colors.red,
        ),
      );
    }
  }

  _addTaskToDb() async {
    int value = await _taskController.addTask(
        task: Task(
          title:_titleController.text,
          color: _selectedColor,
          lat: homelat,
          lan: homelan
        )
    );
    print("My id is " + "$value");
  }

  _appBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      //backgroundColor: ,
      leading: GestureDetector(
        onTap: (){
          Get.back();
        },
        child: Icon(
          Icons.arrow_back_ios,
          size: 20,
          color: Colors.black,
        ),
      ),
    );
  }
}
//
// () {
// pointName = _titleController.text;
// Navigator.of(context).push(MaterialPageRoute(
// builder: (context) =>
// CurrentLocationScreen()));
// },

// ()=>_validateData()