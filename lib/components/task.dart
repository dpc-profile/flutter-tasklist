import 'package:first_project_alura/components/difficulty.dart';
import 'package:first_project_alura/components/progress_bar.dart';
import 'package:flutter/material.dart';

class Task extends StatefulWidget {
  final String nomeTask;
  final String imgSrc;
  final int dificuldade;

  const Task(this.nomeTask, this.imgSrc, this.dificuldade, {Key? key})
      : super(key: key);

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
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
              Container(
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: ProgressBar.funcMaestria(nivelMaestria),
                ),
              ),
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.white,
                    ),
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          //Imagem da tarefa
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.black26,
                          ),
                          width: 72,
                          height: 100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child:
                                Image.asset(widget.imgSrc, fit: BoxFit.cover),
                          ),
                        ),
                        Column(
                          // Titulo da tarefa
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 200,
                              child: Text(
                                widget.nomeTask,
                                style: const TextStyle(
                                  fontSize: 24,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            Difficulty(
                              levelDifficulty: widget.dificuldade,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 52,
                          width: 52,
                          child: elementLevelUpButton(),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      elementProgressBar(),
                      elementLevelText(),
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

  Padding elementLevelText() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        (nivelMaestria < ProgressBar.maestriaMaxLevel)
            ? "Nivel $nivel"
            : "Nivel Max",
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }

  Padding elementProgressBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 200,
        child: LinearProgressIndicator(
          color: Colors.white,
          value: valorProgressao,
        ),
      ),
    );
  }

  ElevatedButton elementLevelUpButton() {
    return ElevatedButton(
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
                  valorProgressao = funcNewProgress(
                      dificuldade: widget.dificuldade,
                      nivel: nivel,
                      nivelMaestria: nivelMaestria);
                }
              });
            },
      style: ElevatedButton.styleFrom(
        primary: ProgressBar.funcMaestria(nivelMaestria),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: const [
          Icon(Icons.arrow_drop_up),
          Text("UP", style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  double funcNewProgress(
      {required int dificuldade, required nivel, required nivelMaestria}) {
    return (dificuldade > 0) ? ((nivel / dificuldade) / 10) / nivelMaestria : 0;
  }
}
