import 'package:first_project_alura/data/task_inherited.dart';
import 'package:flutter/material.dart';
import 'package:first_project_alura/components/custom_colors.dart';

class CreateTask extends StatefulWidget {
  const CreateTask({Key? key, required this.taskContext}) : super(key: key);

  final BuildContext taskContext;

  @override
  State<CreateTask> createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  int star = 1;
  Color paleGrey = CustomColors.paleGrey;
  Color lightBlueGrey = CustomColors.lightBlueGrey;

  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        backgroundColor: lightBlueGrey,
        appBar: AppBar(title: const Text("Criar Tarefa")),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: SizedBox(
              width: 375,
              height: 450,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextFormField(
                    validator: (value) {
                      // Verifica se e nulo e vazio
                      if (value!.isEmpty) {
                        return "Insira o nome da tarefa";
                      }
                      return null;
                    },
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: "Nome da Tarefa",
                      fillColor: paleGrey, // Pale Gray
                      filled: true,
                    ),
                  ), //NomeTarefa
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
                  ), //Dificuldade
                  TextFormField(
                    onChanged: (text) {
                      setState(() {});
                    },
                    keyboardType: TextInputType.url,
                    controller: imageController,
                    decoration: InputDecoration(
                      labelText: "Imagem",
                      fillColor: paleGrey, // Pale Gray
                      filled: true,
                    ),
                  ), //Url Imagem
                  Container(
                    height: 100,
                    width: 72,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        imageController.text,
                        errorBuilder: ((BuildContext context, Object error,
                                StackTrace? stackTrace) =>
                            Image.asset("assets/img/noPhoto.png")),
                      ),
                    ),
                  ), //Icone Imagem
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
                          TaskInherited.of(widget.taskContext).newTask(
                              nameController.text, imageController.text, star);
                          onButtonAddTask(context, nameController.text);
                        },
                        child: const Text("Adicionar"),
                      ),
                    ],
                  ) // Botao Cancelar e Adicionar
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onButtonAddTask(context, String taskTittle) {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Salvando Tarefa "$taskTittle"'),
      ));
      Navigator.pop(context);
    }
  }
}
