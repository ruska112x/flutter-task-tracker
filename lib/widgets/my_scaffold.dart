import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task_tracker/data_classes/task.dart';
import 'package:task_tracker/widgets/task_widget.dart';

class MyScaffold extends StatefulWidget {
  const MyScaffold({super.key});

  @override
  State<MyScaffold> createState() => _MyScaffoldState();
}

class _MyScaffoldState extends State<MyScaffold> {
  late TextEditingController _nameController;
  late TextEditingController _contentController;
  late TextEditingController _difficultyController;
  final List<Task> _tasks = [];

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _contentController = TextEditingController();
    _difficultyController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _contentController.dispose();
    _difficultyController.dispose();
  }

  void addTask() {
    Task newTask = Task.defaultTask();
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Create Task"),
            content: SizedBox(
              height: 320,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(hintText: "Task Name"),
                    maxLength: 64,
                    onChanged: (String name) async {
                      newTask.name = name;
                    },
                  ),
                  TextField(
                    controller: _contentController,
                    decoration: const InputDecoration(hintText: "Task Content"),
                    onChanged: (String content) {
                      newTask.content = content;
                    },
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    controller: _difficultyController,
                    decoration: const InputDecoration(hintText: "Difficulty"),
                    onChanged: (String difficulty) {
                      newTask.difficulty = int.parse(difficulty);
                    },
                  )
                ],
              ),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      _tasks.add(newTask);
                      _nameController.clear();
                      _contentController.clear();
                      _difficultyController.clear();
                    });
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.add))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Task Tracker"),
      ),
      body: _tasks.isNotEmpty
          ? Center(
              child: ListView.builder(
                padding: const EdgeInsets.all(4),
                itemCount: _tasks.length,
                itemBuilder: (BuildContext context, int index) {
                  return TaskWidget(task: _tasks[index]);
                },
              ),
            )
          : const Center(child: Text("No Items")),
      floatingActionButton: FloatingActionButton(
        onPressed: addTask,
        child: const Icon(Icons.add_circle),
      ),
    );
  }
}
