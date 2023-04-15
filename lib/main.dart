import 'package:flutter/material.dart';
import 'package:flutter_task_app/src/shared/schemes/color_schemes.g.dart';
import 'package:flutter_task_app/views/home_page/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  await Hive.initFlutter();

  var box = await Hive.openBox('localstorage');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TaskApp',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
        scaffoldBackgroundColor: lightColorScheme.background,
        appBarTheme: AppBarTheme(
            centerTitle: true,
            backgroundColor: lightColorScheme.primary,
            foregroundColor: lightColorScheme.onPrimary),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: lightColorScheme.primary),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: darkColorScheme.background,
        colorScheme: darkColorScheme,
        appBarTheme: AppBarTheme(
            centerTitle: true,
            backgroundColor: darkColorScheme.primary,
            foregroundColor: darkColorScheme.onPrimary),
      ),
      home: const HomePage(),
    );
  }
}
