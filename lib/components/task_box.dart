import 'package:flutter/material.dart';
import 'package:flutter_app/constants.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'task_display.dart';
import 'task_add.dart';
import 'taskDetails.dart';

class TaskBox extends StatefulWidget {
  //for hot reload/ctrl+s
  @override
  _TaskBoxState createState() => _TaskBoxState();
}

class _TaskBoxState extends State<TaskBox> {
  String taskTitle = '';
  String taskDescription ='';

  void addTask() {
    _navigateAndReturnResult(context);
  }

  _navigateAndReturnResult(BuildContext context) async { //Underline: private
    final task = await Navigator.pushNamed(context, '/addTask');
    if (task != null){
      TaskDetails taskDetails = task;
      setState(() {
        taskTitle = taskDetails.taskTitle ?? ''; //infront ?? not null, return infront/ else return behind
        taskDescription = taskDetails.taskDescription ?? '';
      });
    }
  }


  void deleteTask() {
    setState(() {
      taskTitle = '';
    });
  }



  Widget build(BuildContext context) {
    if (taskTitle != '') {
      return Expanded(
        child: Padding(
          padding: kTaskBoxMargin,
          child: Slidable(
            actionPane: SlidableDrawerActionPane(),
            actionExtentRatio: kActionExtentRatio,
            secondaryActions: <Widget>[
              IconSlideAction(
                caption: 'Edit',
                color: Theme.of(context).accentColor,
                icon: Icons.mode_edit,
              ),
              IconSlideAction(
                caption: 'Delete',
                color: Theme.of(context).errorColor,
                icon: Icons.delete,
                onTap: () => deleteTask(),
              ),
            ],
            child: TaskDisplay(
              task: taskTitle,
            ),
          ),
        ),
      );
    } else {
      return TaskAdd(
        addTask: addTask,
      );
    }
  }
}
