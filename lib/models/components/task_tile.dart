import 'package:flutter/material.dart';

import '../../data/database.dart';

class TaskTile extends StatefulWidget {
  final Function(int) onDelete;
  final int index;
  const TaskTile({Key? key, required this.onDelete, required this.index})
      : super(key: key);

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  TaskDb db = TaskDb();
  bool _ischecked = false;
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      onChanged: (bool? newValue) {
        setState(() {
          _ischecked = newValue!;
        });
        db.updateData();
      },
      value: _ischecked,
      title: TextField(
        controller: _textEditingController,
      ),
      secondary: PopupMenuButton(
        itemBuilder: (BuildContext context) {
          return [
            PopupMenuItem(
                child: TextButton(
                    onPressed: () {
                      setState(() {
                        widget.onDelete(widget.index);
                        Navigator.pop(context);
                      });
                    },
                    child: const Text('Delete'))),
          ];
        },
      ),
    );
  }
}
