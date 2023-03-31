import 'package:flutter/material.dart';

enum SampleItem { itemOne, itemTwo, itemThree }

class Task extends StatefulWidget {
  const Task({super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  bool _isChecked = false;
  String _taskText = '';
  SampleItem? selectedMenu;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        value: _isChecked,
        onChanged: (value) {
          setState(() {
            _isChecked = value!;
          });
        },
        title: TextField(
          onChanged: (text) {
            setState(() {
              _taskText = text;
            });
          },
        ),
        secondary: PopupMenuButton(
          initialValue: selectedMenu,
          onSelected: (item) {
            setState(() {
              selectedMenu = item;
            });
          },
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: SampleItem.itemOne,
              child: Text('Edit'),
            ),
            const PopupMenuItem(
              value: SampleItem.itemTwo,
              child: Text('Delete'),
            )
          ],
        ));
  }
}
