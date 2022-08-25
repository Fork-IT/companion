import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/identify_task_controller.dart';
import '../identify_utility.dart';
import 'package:image_picker/image_picker.dart';
import '../models/identify_task.dart';
import '../widgets/identify_buttons.dart';
import '../widgets/identify_input_field.dart';
import 'identify_theme.dart';
import 'package:file_picker/file_picker.dart';

class IdentifyAddTaskPage extends StatefulWidget {
  const IdentifyAddTaskPage({Key? key}) : super(key: key);

  @override
  State<IdentifyAddTaskPage> createState() => _IdentifyAddTaskPageState();
}

class _IdentifyAddTaskPageState extends State<IdentifyAddTaskPage> {
  final IdentifyTaskController _taskController = Get.put(IdentifyTaskController());
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _relationController = TextEditingController();
  bool flag = false;
  //PlatformFile? file;
  String? imgString;
  bool a_flag = false;
  PlatformFile? file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Add Image",
                style: headingStyle,
              ),
              IdentifyMyInputField(title: "Name of person", hint: "Enter the name of person", controller: _nameController,),
              IdentifyMyInputField(title: "Relation with person", hint: "Enter the relationship", controller: _relationController,),
              const SizedBox(height: 18,),
              ElevatedButton(
                  onPressed: () async{
                    flag = true;
                    final ImagePicker _picker = ImagePicker();
                    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
                    if(image == null)
                      {
                        flag = false;
                        return;
                      }
                    imgString = Utility.base64String(await image.readAsBytes());
                  },
                  child: const Text(
                    "Choose Image"
                  )
              ),
              ElevatedButton(
                  onPressed: () async{
                    a_flag = true;
                    final result = await FilePicker.platform.pickFiles();
                    if(result == false)
                      {
                        a_flag = false;
                        return;
                      }
                    file = result!.files.first;
                  },
                  child: const Text(
                      "Choose Audio"
                  )
              ),
              const SizedBox(height: 25,),
              IdentifyMyButton(label: "Add", onTap: ()=>_validateDate()),
            ],
          ),
        )
      ),
    );
  }

  _validateDate(){
    if(_nameController.text.isNotEmpty && _relationController.text.isNotEmpty && flag==true && a_flag==true) {
      _addTaskToDb();
      Get.back();
    }
    else if(_nameController.text.isEmpty || _relationController.text.isEmpty || flag==false || a_flag==false){
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
        task: IdentifyTask(
          name:_nameController.text,
          relation: _relationController.text,
          photo: imgString,
          path: file!.path,
        )
    );
    if (kDebugMode) {
      print("My id is " + "$value");
    }
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