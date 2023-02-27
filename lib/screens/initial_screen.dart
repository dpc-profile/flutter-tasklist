import 'package:first_project_alura/components/custom_colors.dart';
import 'package:first_project_alura/data/task_inherited.dart';
import 'package:first_project_alura/screens/create_task_screen.dart';
import 'package:flutter/material.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool opacidade = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.lightBlueGrey,
      appBar: AppBar(
        leading: Container(),
        title: const Text("Tarefas"),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                setState(() {
                  opacidade = !opacidade;
                });
              },
              icon: opacidade
                  ? const Icon(Icons.visibility)
                  : const Icon(Icons.visibility_off)),
        ],
      ),
      body: AnimatedOpacity(
        opacity: opacidade ? 1 : 0,
        duration: const Duration(milliseconds: 500),
        child: ListView(
          padding: const EdgeInsets.only(top: 8, bottom: 80),
          children: TaskInherited.of(context).taskList,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          onButtonCreateTask(context);
        },
        child: const Icon(Icons.add),
      ), //AddButton
    );
  }

  void onButtonCreateTask(context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (contextNew) => CreateTask(taskContext: context),
        ));
  }
}
