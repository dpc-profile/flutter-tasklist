import 'package:first_project_alura/components/task.dart';
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
      backgroundColor: const Color(0xFFD0DDED), // Light Blue Grey,
      appBar: AppBar(leading: Container(), title: const Text("Tarefas")),
      body: AnimatedOpacity(
        opacity: opacidade ? 1 : 0,
        duration: const Duration(milliseconds: 500),
        child: ListView(
          children: const [
            Task(
              "Aprender Flutter",
              "assets/img/aprender_flutter.png",
              3,
            ),
            Task(
              "Andar de Bike",
              "assets/img/andar_bicicleta.jpg",
              5,
            ),
            Task(
              "Ler",
              "assets/img/ler.jpg",
              2,
            ),
            Task(
              "Meditar",
              "assets/img/meditar.jpeg",
              4,
            ),
            Task(
              "Jogar",
              "assets/img/jogar.jpg",
              1,
            ),
            SizedBox(
              height: 80,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            opacidade = !opacidade;
          });
        },
        child: opacidade
            ? const Icon(Icons.remove_red_eye)
            : const Icon(Icons.remove_red_eye_outlined),
      ),
    );
  }
}
