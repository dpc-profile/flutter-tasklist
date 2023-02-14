import 'package:flutter/material.dart';

class CreateTask extends StatefulWidget {
  const CreateTask({Key? key}) : super(key: key);

  @override
  State<CreateTask> createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD0DDED), // Light Blue Grey,
      appBar: AppBar(title: const Text("Criar Tarefa")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Colors.black12,
          width: 375,
          height: 400,
        ),
      ),
      );
  }
}
