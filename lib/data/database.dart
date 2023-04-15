import 'package:hive_flutter/hive_flutter.dart';

class TaskDb {
  List taskList = [];

  final _localStorage = Hive.box('localstorage');

  void createInitialData() {
    taskList = [];
  }

  void loadData() {
    taskList = _localStorage.get("TASKLIST");
  }

  void updateData() {
    _localStorage.put("TASKLIST", taskList);
  }
}
