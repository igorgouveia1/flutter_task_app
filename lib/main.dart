import 'package:flutter/material.dart';
import 'package:flutter_task_app/src/shared/schemes/color_schemes.g.dart';
import 'package:flutter_task_app/src/widgets/check_box_tile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Widget> _listItems = [];

  void removeItem(int index) {
    setState(() {
      _listItems.removeAt(index);
    });
  }

  void addItem() {
    int newIndex = _listItems.length; // obter o índice da nova tarefa
    setState(() {
      _listItems.add(
        Card(
          child: Task(
            index: newIndex, // passando o índice para a nova tarefa
            onDelete: (index) => removeItem(index),
          ),
        ),
      );
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task App',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: lightColorScheme.primary,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: lightColorScheme.primary),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: darkColorScheme,
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: darkColorScheme.primary,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Task App',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: ListView.builder(
          itemCount: _listItems.length,
          itemBuilder: (BuildContext context, int index) {
            return _listItems[index];
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            addItem();
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
