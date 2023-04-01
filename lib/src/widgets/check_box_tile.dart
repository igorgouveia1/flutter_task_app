import 'package:flutter/material.dart';

enum SampleItem { itemOne, itemTwo }

class Task extends StatefulWidget {
  final Function(int) onDelete;
  final int index;
  const Task({super.key, required this.onDelete, required this.index});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  bool _isChecked = false;
  String _taskText = '';
  SampleItem? selectedMenu;
  bool opacity = false;
  bool textFieldEnabled = true;
  late FocusNode myFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _isChecked ? 0.5 : 1,
      duration: const Duration(milliseconds: 500),
      child: CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading,
          value: _isChecked,
          onChanged: (value) {
            setState(
              () {
                _isChecked = value!;
              },
            );
          },
          title: TextField(
            autofocus: true,
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
            enabled: textFieldEnabled,
            focusNode: myFocusNode,
            onChanged: (text) {
              setState(() {
                _taskText = text;
              });
            },
            onEditingComplete: () {
              setState(() {
                textFieldEnabled = false;
              });
            },
            onSubmitted: (value) {
              setState(() {
                textFieldEnabled = false;
              });
            },
            onTapOutside: (event) {
              setState(() {
                textFieldEnabled = false;
              });
            },
          ),
          secondary: PopupMenuButton(
            initialValue: selectedMenu,
            onSelected: (item) {
              setState(() {
                selectedMenu = item;
                if (selectedMenu == SampleItem.itemOne) {
                  myFocusNode.requestFocus();
                  textFieldEnabled = true;
                }
              });
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: SampleItem.itemOne,
                child: TextButton(
                    onPressed: () {
                      setState(() {
                        textFieldEnabled = true;
                        myFocusNode.requestFocus();

                        Navigator.pop(context);
                      });
                    },
                    child: const Text('Edit')),
              ),
              PopupMenuItem(
                value: SampleItem.itemTwo,
                child: TextButton(
                    onPressed: () {
                      setState(() {
                        widget.onDelete(widget.index);
                        Navigator.pop(context);
                      });
                    },
                    child: const Text('Delete')),
              )
            ],
          )),
    );
  }
}
