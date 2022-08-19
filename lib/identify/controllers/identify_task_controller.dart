import 'package:get/get.dart';
import '../db/identify_db_helper.dart';
import '../models/identify_task.dart';

class IdentifyTaskController extends GetxController {

  @override
  void onReady() {
    getTasks();
    super.onReady();
  }

  var taskList = <IdentifyTask>[].obs;

  Future<int> addTask({IdentifyTask? task}) async {
    return await IdentifyDBHelper.insert(task);
  }

  void getTasks() async {
    List<Map<String, dynamic>> tasks = await IdentifyDBHelper.query();
    taskList.assignAll(tasks.map((data) => new IdentifyTask.fromJson(data)).toList());
  }

  void delete(IdentifyTask task) {
    IdentifyDBHelper.delete(task);
    getTasks();
  }
}