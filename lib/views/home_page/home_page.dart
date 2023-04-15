import 'package:flutter/material.dart';
import 'package:flutter_task_app/data/database.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../models/components/task_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _localStorage = Hive.box('localstorage');
  TaskDb db = TaskDb();

  @override
  void initState() {
    if (_localStorage.get("TASKLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  void _addTask() {
    setState(() {
      db.taskList.add('');
    });
    db.updateData();
  }

  void _deleteTask(int index) {
    setState(() {
      db.taskList.removeAt(index);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'TaskApp',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        itemCount: db.taskList.length,
        itemBuilder: (BuildContext context, int index) {
          return TaskTile(
              index: index, onDelete: (index) => _deleteTask(index));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addTask();
        },
        child: const Icon(
          Icons.edit,
          color: Colors.white,
        ),
      ),
    );
  }
}
