import 'package:first_project_alura/components/initial_screen/task.dart';
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
      backgroundColor: const Color(0xFFD0DDED), // Light Blue Grey,
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
          children: const [
            TaskCard(
              "Aprender Flutter",
              "assets/img/aprender_flutter.png",
              3,
            ),
            TaskCard(
              "Andar de Bike",
              "assets/img/andar_bicicleta.jpg",
              5,
            ),
            TaskCard(
              "Ler",
              "assets/img/ler.jpg",
              2,
            ),
            TaskCard(
              "Meditar",
              "assets/img/meditar.jpeg",
              4,
            ),
            TaskCard(
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CreateTask(),
                ),
              );
            });
          },
          child: const Icon(Icons.add)),
    );
  }
}
