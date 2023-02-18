import 'package:first_project_alura/components/custom_colors.dart';
import 'package:flutter/material.dart';

class CreateTask extends StatefulWidget {
  const CreateTask({Key? key}) : super(key: key);

  @override
  State<CreateTask> createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  int star = 1;
  Color paleGrey = CustomColors.paleGrey;
  Color lightBlueGrey = CustomColors.lightBlueGrey;

  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: lightBlueGrey,
      appBar: AppBar(title: const Text("Criar Tarefa")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: 375,
          height: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: "Nome da Tarefa",
                  fillColor: paleGrey, // Pale Gray
                  filled: true,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: paleGrey,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                      child: Text(
                        "Dificuldade",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 40,
                          child: TextButton(
                            child: const Icon(Icons.star),
                            onPressed: () {
                              setState(() {
                                star = 1;
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          width: 40,
                          child: TextButton(
                            child: star > 1
                                ? const Icon(Icons.star)
                                : const Icon(Icons.star_border),
                            onPressed: () {
                              setState(() {
                                star = 2;
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          width: 40,
                          child: TextButton(
                            child: star > 2
                                ? const Icon(Icons.star)
                                : const Icon(Icons.star_border),
                            onPressed: () {
                              setState(() {
                                star = 3;
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          width: 40,
                          child: TextButton(
                            child: star > 3
                                ? const Icon(Icons.star)
                                : const Icon(Icons.star_border),
                            onPressed: () {
                              setState(() {
                                star = 4;
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          width: 40,
                          child: TextButton(
                            child: star > 4
                                ? const Icon(Icons.star)
                                : const Icon(Icons.star_border),
                            onPressed: () {
                              setState(() {
                                star = 5;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.blue, //Text Color
                      backgroundColor: paleGrey, //Button Color
                    ),
                    onPressed: () {},
                    child: const Text("Cancelar"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      print(nameController.text);
                    },
                    child: const Text("Adicionar"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
