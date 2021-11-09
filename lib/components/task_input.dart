import 'package:flutter/material.dart';
import '../constants.dart';

class TaskInput extends StatelessWidget {
  TaskInput({
    @required this.taskTitleTextController,
    @required this.expands,
  });

  final TextEditingController taskTitleTextController;
  final bool expands;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: kTaskInputMargin,
        child: TextField(
          controller: taskTitleTextController,
          autofocus: false, //expands false maxlines 1
          expands: expands,
          maxLines: expands ? null : 1,
        ),
      ),
    );
  }
}
