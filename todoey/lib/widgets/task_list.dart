import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:gktodo/widgets/task_tile.dart';

import '../task_data.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, taskData, child) {
      return ListView.builder(
        itemBuilder: (context, index) {
          final task = taskData.tasks[index];
          return TaskTile(
              taskId: task.taskId,
              taskTitle: task.name,
              isChecked: task.isDone,
              checkboxCallback: (checkboxState) {
                taskData.updateTask(task);
              },
              deleteCallback: () {
                taskData.deleteTask(task);
              });
        },
        padding: EdgeInsets.only(top: 20),
        itemCount: taskData.taskCount,
      );
    });
  }
}
