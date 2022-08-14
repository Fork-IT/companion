import 'package:get/get.dart';
import '../db/db_helper2.dart';
import '../models/task2.dart';

class TaskController2 extends GetxController {

  @override
  void onReady() {
    getTasks();
    super.onReady();
  }

  var taskList = <Task>[].obs;

  Future<int> addTask({Task? task}) async {
    return await DBHelper2.insert(task);
  }

  void getTasks() async {
    List<Map<String, dynamic>> tasks = await DBHelper2.query();
    taskList.assignAll(tasks.map((data) => new Task.fromJson(data)).toList());
  }

  void delete(Task task) {
    DBHelper2.delete(task);
    getTasks();
  }
}