import 'package:flutter/material.dart';
import 'package:flutter_task_app/src/shared/schemes/color_schemes.g.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
          title: const Text('teste'),
        ),
        body: ListView(
          children: const [
            Card(
              child: ListTile(
                title: Text('teste'),
                trailing: Icon(Icons.more_vert),
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
