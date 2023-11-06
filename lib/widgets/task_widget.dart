import 'package:flutter/material.dart';

import 'package:task_tracker/data_classes/task.dart';

class TaskWidget extends StatefulWidget {
  late Task task;

  TaskWidget({super.key, required this.task});

  @override
  State<StatefulWidget> createState() => _TaskState();
}

class _TaskState extends State<TaskWidget> {
  final Task _defaultTask = Task(0, "", "", false, 100);
  late Task _task;

  final TextStyle _textStyleLineThrough = const TextStyle(
      decoration: TextDecoration.lineThrough,
      decorationThickness: 4,
      decorationColor: Colors.red);

  final TextStyle _textStyleNone =
      const TextStyle(decoration: TextDecoration.none);

  _TaskState();

  _TaskState.defaultTask() {
    _task = _defaultTask;
  }

  @override
  void initState() {
    super.initState();
    _task = widget.task;
  }

  void _setDone() {
    setState(() {
      _task.status = !_task.status;
    });
  }

  void _increaseDifficulty() {
    setState(() {
      _task.difficulty += 1;
    });
  }

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: IconButton(
                  onPressed: _setDone,
                  icon: Icon(_task.status
                      ? Icons.check_box
                      : Icons.check_box_outline_blank),
                ),
                title: Text(
                  _task.name,
                  style: _task.status ? _textStyleLineThrough : _textStyleNone,
                ),
                subtitle: Text(_task.content),
                trailing: Text(_task.difficulty.toString(),
                    style: const TextStyle(fontSize: 16)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: _increaseDifficulty,
                      icon: const Icon(Icons.add)),
                ],
              )
            ],
          ),
        ),
      );
}
