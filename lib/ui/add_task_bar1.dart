import 'package:finaltwo/controllers/task_controller1.dart';
import 'package:finaltwo/ui/theme1.dart';
import 'package:finaltwo/widgets/buttons1.dart';
import 'package:finaltwo/widgets/input_field1.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../models/task1.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  var toDoData;
  final TaskController _taskController = Get.put(TaskController());
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  final TextEditingController _msgBox = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  String _endTime = "9:30 PM";
  String _startTime = DateFormat("hh:mm a").format(DateTime.now()).toString();
  // int _selectedRemind = 5;
  // List<int> remindList = [
  //   5,
  //   10,
  //   15,
  //   20,
  // ];
  String _selectedRepeat = "None";
  List<String> repeatList = [
    "None",
    "Daily",
  ];
  int _selectedColor = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text('Add Task'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20,top: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Add Task",
                style: headingStyle,
              ),
              SizedBox(height: 17,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      print(DateTime.now());
                      print(DateTime.now().runtimeType);
                      _titleController.text = "Take medicines";
                      _noteController.text = "It's the time for medicines";
                      setState(() {
                        _startTime = DateFormat("hh:mm a").format(DateTime.parse('2022-08-26 21:00:50.335213')).toString();
                      });
                      print(_startTime);
                    }, // Image tapped
                    child: Image.asset(
                      'images/images-removebg-preview.png', // Fixes border issues
                      width: 50,
                      height: 50,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _titleController.text = "Go for a walk";
                      _noteController.text = "It's the time for your walk";
                      setState(() {
                        _startTime = DateFormat("hh:mm a").format(DateTime.parse('2022-08-26 07:00:50.335213')).toString();
                      });
                    }, // Image tapped
                    child: Image.asset(
                      'images/walking--v2.png', // Fixes border issues
                      width: 50,
                      height: 50,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _titleController.text = "Gadgets charging";
                      _noteController.text = "Don't forget to charge your devices";
                      setState(() {
                        _startTime = DateFormat("hh:mm a").format(DateTime.parse('2022-08-26 12:00:50.335213')).toString();
                      });
                    }, // Image tapped
                    child: Image.asset(
                      'images/3513283.png', // Fixes border issues
                      width: 50,
                      height: 50,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _titleController.text = "Yoga and exercise";
                      _noteController.text = "It's time for yoga and exercise";
                      setState(() {
                        _startTime = DateFormat("hh:mm a").format(DateTime.parse('2022-08-26 07:00:50.335213')).toString();
                      });
                    }, // Image tapped
                    child: Image.asset(
                      'images/2689027.png', // Fixes border issues
                      width: 50,
                      height: 50,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _titleController.text = "TV serial";
                      _noteController.text = "Don't miss out your favourite TV serial";
                      setState(() {
                        _startTime = DateFormat("hh:mm a").format(DateTime.parse('2022-08-26 08:30:50.335213')).toString();
                      });
                    }, // Image tapped
                    child: Image.asset(
                      'images/1056977.png', // Fixes border issues
                      width: 50,
                      height: 50,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Text(
                "Fill fields with the help of shortcuts!"
              ),
              Divider(thickness: 2,
                color: Colors.black,),
              MyInputField(title: "Title", hint: "Enter your title", controller: _titleController,),
              MyInputField(title: "Note", hint: "Enter your note", controller: _noteController,),
              MyInputField(title: "Date", hint: DateFormat.yMd().format(_selectedDate),
                  widget: IconButton(
                    icon: Icon(Icons.calendar_today_outlined,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      _getDateFromUser();
                    },
              )
              ),
              Row(
                children: [
                  Expanded(
                      child: MyInputField(
                        title: "Time",
                        hint: _startTime,
                        widget: IconButton(
                          onPressed: () {
                            _getTimeFromUser(isStartTime: true);
                          },
                          icon: Icon(
                            Icons.access_time_rounded,
                            color: Colors.grey,
                          ),
                        ),
                      )
                  ),
                ],
              ),
              // MyInputField(title: "Remind", hint: "$_selectedRemind minutes early",
              //   widget: DropdownButton(
              //     icon: Icon(Icons.keyboard_arrow_down,
              //       color: Colors.grey,
              //     ),
              //     iconSize: 32,
              //     elevation: 4,
              //     style: subTitleStyle,
              //     underline: Container(height: 0,),
              //     onChanged: (String? newValue) {
              //       setState(() {
              //         _selectedRemind = int.parse(newValue!);
              //       });
              //     },
              //     items: remindList.map<DropdownMenuItem<String>>((int value){
              //       return DropdownMenuItem<String>(
              //         value: value.toString(),
              //         child: Text(value.toString()),
              //       );
              //     }
              //     ).toList(),
              //   ),
              // ),
              MyInputField(title: "Repeat", hint: "$_selectedRepeat",
                widget: DropdownButton(
                  icon: Icon(Icons.keyboard_arrow_down,
                    color: Colors.grey,
                  ),
                  iconSize: 32,
                  elevation: 4,
                  style: subTitleStyle,
                  underline: Container(height: 0,),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedRepeat = newValue!;
                    });
                  },
                  items: repeatList.map<DropdownMenuItem<String>>((String? value){
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value!, style: TextStyle(color: Colors.grey)),
                    );
                  }
                  ).toList(),
                ),
              ),
              SizedBox(height: 18,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Color",
                      style: titleStyle,
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
                                  radius: 14,
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
                  // MyButton(label: "Create Task", onTap: ()=>_validateDate()),
                ],
              ),
              SizedBox(height: 10,),
              Text(
                "OR",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Merriweather'
                ),
              ),
              TextField(
                textAlign: TextAlign.center,
                controller: _msgBox,
                decoration: InputDecoration(
                  hintText: "Paste comma separated message here",
                  hintStyle: subTitleStyle,
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: context.theme.backgroundColor,
                          width: 0
                      )
                  ),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.black,
                          width: 0
                      )
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              MyButton(label: "Create Task", onTap: () async{
                toDoData = _msgBox.text.split(',').toList();
                _validateDate();
                Get.back();
              }),
            ],
          ),
        )
      ),
    );
  }

  _validateDate(){
    if(_titleController.text.isNotEmpty && _noteController.text.isNotEmpty) {
      _addTaskToDb();
      // Get.back();
    }
    else if(_titleController.text.isEmpty || _noteController.text.isEmpty){
      _addTasktoDb2();
    }
  }

  _addTasktoDb2() async{
    int value = await _taskController.addTask(
        task: Task(
          note:toDoData[1],
          title:toDoData[0],
          date: toDoData[2],
          startTime: toDoData[3],
          repeat: toDoData[4],
          color: 1,
          isCompleted: 0,
        )
    );
  }

  _addTaskToDb() async {
    int value = await _taskController.addTask(
        task: Task(
          note:_noteController.text,
          title:_titleController.text,
          date: DateFormat.yMd().format(_selectedDate),
          startTime: _startTime,
          //remind: _selectedRemind,
          repeat: _selectedRepeat,
          color: _selectedColor,
          isCompleted: 0,
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

  _getDateFromUser() async {
    DateTime? _pickerDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015),
        lastDate: DateTime(2121)
    );

    if(_pickerDate!=null){
      setState(() {
        _selectedDate = _pickerDate;
        print(_selectedDate);
      });
    }
    else{
      print("it's null or something is wrong");
    }
  }

  _getTimeFromUser({required bool isStartTime}) async {
    var pickedTime = await _showTimePicker();
    String _formatedTime = pickedTime.format(context);
    if(pickedTime==null) {
      print("Time canceled");
    }
    else if(isStartTime==true) {
      setState(() {
        _startTime = _formatedTime;
      });
    }
    else if(isStartTime==false) {
      setState(() {
        _endTime = _formatedTime;
      });
    }
  }
  _showTimePicker() {
    return showTimePicker(
        initialEntryMode: TimePickerEntryMode.input,
        context: context,
        initialTime: TimeOfDay(
          hour: int.parse(_startTime.split(":")[0]),
          minute: int.parse(_startTime.split(":")[1].split(" ")[0])
        )
    );
  }
}