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
      body: Container(

        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: Colors.black,
            height: 400,
          ),
        ),
        // child: Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Container(
        //     color: Colors.black,
        //     height: 400,
        //     width: 375,
        //     child: Column(
        //       children: [],
        //     ),
        //   ),
        // ),
      ),
    );
  }



}
