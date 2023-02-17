import 'package:first_project_alura/components/initial_screen/element_task.dart';
import 'package:first_project_alura/components/initial_screen/progress_bar.dart';
import 'package:flutter/material.dart';

class TaskCard extends StatefulWidget {
  final String nomeTask;
  final String imgSrc;
  final int dificuldade;

  const TaskCard(this.nomeTask, this.imgSrc, this.dificuldade, {Key? key})
      : super(key: key);

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  int nivel = 0;
  int nivelMaestria = 1;
  double valorProgressao = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Stack(
            children: [
              ElementsTask.backgroundTaskCard(
                nivelMaestria: nivelMaestria,
              ),
              Column(
                children: [
                  Container(
                    decoration: ElementsTask.taskCard(),
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElementsTask.taskImage(
                          imgSrc: widget.imgSrc,
                        ),
                        ElementsTask.nameAndDifficulty(
                          nomeTask: widget.nomeTask,
                          dificuldade: widget.dificuldade,
                        ),
                        elementLevelUpButton(),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElementsTask.progressBar(
                        valorProgressao: valorProgressao,
                      ),
                      ElementsTask.levelText(
                        nivelMaestria: nivelMaestria,
                        nivel: nivel,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  SizedBox elementLevelUpButton() {
    return SizedBox(
      height: 52,
      width: 52,
      child: ElevatedButton(
        onPressed: nivelMaestria >= ProgressBar.maestriaMaxLevel
            ? null
            : () {
                setState(() {
                  nivel++;

                  if (valorProgressao >= 1.0) {
                    nivelMaestria++;
                    valorProgressao = 0;
                    nivel = 0;
                  } else {
                    valorProgressao = ElementsTask.funcNewProgress(
                        dificuldade: widget.dificuldade,
                        nivel: nivel,
                        nivelMaestria: nivelMaestria);
                  }
                });
              },
        style: ElevatedButton.styleFrom(
          primary: ProgressBar.funcMaestriaColor(nivelMaestria),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: const [
            Icon(Icons.arrow_drop_up),
            Text(
              "UP",
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
