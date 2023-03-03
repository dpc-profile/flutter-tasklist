import 'package:first_project_alura/components/initial_screen/task.dart';
import 'package:flutter/material.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  final List<TaskCard> taskList = [
    TaskCard("Aprender Flutter", "assets/img/aprender_flutter.png", 3),
    TaskCard("Andar de Bike", "assets/img/andar_bicicleta.jpg", 5),
    TaskCard("Ler", "assets/img/ler.jpg", 2),
    TaskCard("Meditar", "assets/img/meditar.jpeg", 4),
    TaskCard("Jogar", "assets/img/jogar.jpg", 1),
  ];

  void newTask(String name, String photo, int difficulty){
    taskList.add(TaskCard(name, photo, difficulty));
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result =
        context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }

  double sumLevels(){
    double sumLevel = 0;

    for (var task in taskList) {
      sumLevel += (task.permNivel/10) * task.dificuldade;
    }

    return sumLevel;
  }
}
