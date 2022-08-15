import 'package:finaltwo/controllers/task_controller.dart';
import 'package:finaltwo/ui/theme.dart';
import 'package:finaltwo/widgets/buttons.dart';
import 'package:finaltwo/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../models/task.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final TaskController _taskController = Get.put(TaskController());
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _relationController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.cyan,
        elevation: 10,
        title: Text('Connect with your loved ones') ,

      ),
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20,top: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Add Contact Details",
                style: headingStyle,
              ),
              MyInputField(title: "Name", hint: "Enter the name", controller: _nameController,),
              MyInputField(title: "Relation", hint: "Enter the relation", controller: _relationController,),
              MyInputField2(title: "Contact Number", hint: "Enter the contact number", controller: _numberController,),
              const SizedBox(height: 18,),
              MyButton(label: "Add", onTap: ()=>_validateDate()),
            ],
          ),
        )
      ),
    );
  }

  _validateDate(){
    if(_nameController.text.isNotEmpty && _relationController.text.isNotEmpty && _numberController.text.isNotEmpty) {
      // print("the observing thing is here");
      // print(_numberController.text);
      // print(_numberController.text.runtimeType);
      _addTaskToDb();
      Get.back();
    }
    else if(_nameController.text.isEmpty || _relationController.text.isEmpty || _numberController.text.isEmpty){
      Get.snackbar("Required", "All fields are required !",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.white,
        colorText: pinkClr,
        icon: const Icon(Icons.warning_amber_rounded,
        color: Colors.red,
        ),
      );
    }
  }

  _addTaskToDb() async {
    int value = await _taskController.addTask(
        task: Task(
          relation:_relationController.text,
          name:_nameController.text,
          number: int.parse(_numberController.text),
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
        child: const Icon(
          Icons.arrow_back_ios,
          size: 20,
          color: Colors.black,
        ),
      ),
    );
  }
}