import 'package:first_project_alura/components/initial_screen/element_task.dart';
import 'package:first_project_alura/components/initial_screen/progress_bar.dart';
import 'package:flutter/material.dart';

class TaskCard extends StatefulWidget {
  final String nomeTask;
  final String imgSrc;
  final int dificuldade;

  TaskCard(this.nomeTask, this.imgSrc, this.dificuldade, {Key? key})
      : super(key: key);

  int nivel = 0;
  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {

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
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.black26,
                          ),
                          width: 72,
                          height: 100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: searchImage(image: widget.imgSrc, imageFit: BoxFit.cover)
                          ),
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
                        nivel: widget.nivel,
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

  Image searchImage({required String image, required imageFit}){
    if (image.contains('http')){
      return Image.network(image, errorBuilder: ((BuildContext context, Object error, StackTrace? stackTrace) =>
          Image.asset("assets/img/noPhoto.png")), fit: imageFit,
      );
    }

    return Image.asset(image, fit: imageFit);
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
                  widget.nivel++;

                  if (valorProgressao >= 1.0) {
                    nivelMaestria++;
                    valorProgressao = 0;
                    widget.nivel = 0;
                  } else {
                    valorProgressao = ElementsTask.funcNewProgress(
                        dificuldade: widget.dificuldade,
                        nivel: widget.nivel,
                        nivelMaestria: nivelMaestria);
                  }
                });
              },
        style: ElevatedButton.styleFrom(
          backgroundColor: ProgressBar.funcMaestriaColor(nivelMaestria),
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
