import 'package:first_project_alura/components/custom_colors.dart';
import 'package:first_project_alura/data/task_inherited.dart';
import 'package:first_project_alura/screens/create_task_screen.dart';
import 'package:flutter/material.dart';

class InitialScreen extends StatefulWidget {
  InitialScreen({Key? key}) : super(key: key);

  int sumGlobalLevel = 0;
  double globalProgressionBar = 0;

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
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Row(
              children: [
                const SizedBox(
                  width: 72,
                ),
                SizedBox(
                  width: 150,
                  child: LinearProgressIndicator(
                    color: Colors.white,
                    value: widget.globalProgressionBar,
                  ),
                ), //ProgressionBar
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    "Nivel ${widget.sumGlobalLevel}",
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ), //Nivel
              ],
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () => setState(() {
              updateGobalLevelAndProgression(context);
            }),
            icon: const Icon(Icons.refresh),
          ), //RefreshButton
          IconButton(
              onPressed: () => setState(() {
                    opacidade = !opacidade;
                  }),
              icon: opacidade
                  ? const Icon(Icons.visibility)
                  : const Icon(Icons.visibility_off)), //EyeButton
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

  void updateGobalLevelAndProgression(context) {
    int sumLevel = TaskInherited.of(context).sumLevels().round();

    widget.sumGlobalLevel = sumLevel;
    widget.globalProgressionBar = sumLevel/100;
  }

}
