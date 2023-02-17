import 'package:flutter/material.dart';

class CreateTask extends StatefulWidget {
  const CreateTask({Key? key}) : super(key: key);

  @override
  State<CreateTask> createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  int star = 1;
  TextEditingController nameController = TextEditingController();

  //TODO Colocar a row dentro em um container, parecido com o TextFormField, com a labelText 'Dificuldade'

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD0DDED), // Light Blue Grey,
      appBar: AppBar(title: const Text("Criar Tarefa")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Colors.black12,
          width: 375,
          height: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: "Nome da Tarefa",
                  fillColor: Color(0xFFF2F2F2), // Pale Gray
                  filled: true,
                ),
              ),
              Row(
                children: [
                  TextButton(
                    child: Icon(Icons.star),
                    onPressed: () {
                      setState(() {
                        star = 1;
                      });
                    },
                  ),
                  TextButton(
                    child: star > 1 ? Icon(Icons.star) : Icon(Icons.star_border),
                    onPressed: () {
                      setState(() {
                        star = 2;
                      });
                    },
                  ),
                  TextButton(
                    child: star > 2 ? Icon(Icons.star) : Icon(Icons.star_border),
                    onPressed: () {
                      setState(() {
                        star = 3;
                      });
                    },
                  ),
                  TextButton(
                    child: star > 3 ? Icon(Icons.star) : Icon(Icons.star_border),
                    onPressed: () {
                      setState(() {
                        star = 4;
                      });
                    },
                  ),
                  TextButton(
                    child: star > 4 ? Icon(Icons.star) : Icon(Icons.star_border),
                    onPressed: () {
                      setState(() {
                        star = 5;
                      });
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.blue, //Text Color
                      backgroundColor: const Color(0xFFF2F2F2), //Button Color
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
