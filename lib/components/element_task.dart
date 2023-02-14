import 'package:first_project_alura/components/difficulty.dart';
import 'package:first_project_alura/components/progress_bar.dart';
import 'package:flutter/material.dart';

class ElementsTask {
  const ElementsTask();

  static double funcNewProgress(
      {required int dificuldade, required nivel, required nivelMaestria}) {
    return (dificuldade > 0) ? ((nivel / dificuldade) / 10) / nivelMaestria : 0;
  }

  static Padding levelText({required nivelMaestria, required nivel}) {
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

  static Padding progressBar({required valorProgressao}) {
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

  static SizedBox taskTitle({required String nomeTask}) {
    return SizedBox(
      width: 200,
      child: Text(
        nomeTask,
        style: const TextStyle(
          fontSize: 24,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

  static Container taskImage({required imgSrc}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.black26,
      ),
      width: 72,
      height: 100,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Image.asset(imgSrc, fit: BoxFit.cover),
      ),
    );
  }

  static BoxDecoration taskCard() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(4),
      color: Colors.white,
    );
  }

  static Container backgroundTaskCard({required nivelMaestria}) {
    return Container(
      height: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: ProgressBar.funcMaestriaColor(nivelMaestria),
      ),
    );
  }

  static Column nameAndDifficulty({required nomeTask, required dificuldade}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElementsTask.taskTitle(
          nomeTask: nomeTask,
        ),
        Difficulty(
          levelDifficulty: dificuldade,
        ),
      ],
    );
  }
}
