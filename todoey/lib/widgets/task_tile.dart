import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final int taskId;
  final String taskTitle;
  final int isChecked;
  final Function checkboxCallback;
  final Function deleteCallback;
  TaskTile(
      {@required this.taskId,
      @required this.taskTitle,
      @required this.isChecked,
      @required this.checkboxCallback,
      @required this.deleteCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: FlatButton(
        child: Icon(
          Icons.delete,
          color: Colors.redAccent,
        ),
        onPressed: deleteCallback,
      ),
      title: Text(
        taskTitle,
        style: TextStyle(
            fontFamily: 'Roboto',
            decoration: isChecked == 1
                ? TextDecoration.lineThrough
                : TextDecoration.none),
      ),
      trailing: Checkbox(
        value: isChecked == 1,
        onChanged: checkboxCallback,
      ),
    );
  }
}
