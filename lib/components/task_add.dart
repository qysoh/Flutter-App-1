import 'package:flutter/material.dart';
import '../constants.dart';

class TaskAdd extends StatelessWidget {
  TaskAdd({@required this.addTask});
  final Function addTask;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1, //default is 1
      child: Container(
        child: FlatButton(
          onPressed: () => addTask(),
          child: Icon(
            Icons.add,
            color: Theme.of(context).accentColor,
            size: kAddIconSize,
          ),
        ),
        color: Theme.of(context).primaryColor,
        margin: kTaskBoxMargin,
      ),
    );
    ;
  }
}
