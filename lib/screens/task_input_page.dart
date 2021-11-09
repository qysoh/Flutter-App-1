import 'package:flutter/material.dart';
import 'package:flutter_app/components/task_input_button.dart';
import '../components/task_input.dart';
import '../components/task_input_button.dart';

class TaskInputPage extends StatefulWidget {
  @override
  _TaskInputPageState createState() => _TaskInputPageState();
}

class _TaskInputPageState extends State<TaskInputPage> { //parents pass to the child (inputtaskbtn)
  final taskTitleTextController = TextEditingController();
  final taskDescriptionTextController = TextEditingController();

  void dispose() {
    //when widget is disposed
    taskTitleTextController.dispose();
    taskDescriptionTextController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add A Task',
        ),
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
        Expanded(
          child: Container(
            child: TaskInput(
              taskTitleTextController: taskTitleTextController,
              expands: false,
            ),
            color: Theme.of(context).primaryColorLight,
          ),
        ),
        Expanded(
          flex: 4,
          child: TaskInput(
            taskTitleTextController: taskDescriptionTextController,
            expands: true,
          ),
          //color: Theme.of(context).primaryColorLight,
        ),
        InputTaskButton(
          taskTitleTextController: taskTitleTextController,
          taskDescTextController: taskDescriptionTextController,
        ),
      ]),
    );
  }
}
