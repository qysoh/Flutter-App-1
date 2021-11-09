import 'package:flutter/material.dart';
import '../constants.dart';
import 'taskDetails.dart';

class InputTaskButton extends StatelessWidget {
  InputTaskButton({@required this.taskTitleTextController,
    @required this.taskDescTextController});

  final TextEditingController taskTitleTextController;
  final TextEditingController taskDescTextController;

  void inputTask(BuildContext context, String taskTitle, String taskDescription){
    Navigator.pop(context, TaskDetails(
      taskTitle: taskTitle,
      taskDescription: taskDescription,
    ), );
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: kAddTaskButtonMargin,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: FlatButton(
        child: Text(
          'Add Task',
        ),
        onPressed: () => inputTask(context, taskTitleTextController.text, taskDescTextController.text),
      ),
    );
  }
}
