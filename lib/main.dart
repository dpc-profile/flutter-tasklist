import 'package:flutter/material.dart';
import 'package:first_project_alura/screens/initial_screen.dart';
import 'package:first_project_alura/screens/create_task_screen.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: "/main",
      routes: {
        "/main" : (context) => const InitialScreen(),
        "/createTask": (context) => const CreateTask(),
      },
    );
  }
}

