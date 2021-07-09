import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:gktodo/task_data.dart';

String taskTitle;

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TaskData provider = Provider.of<TaskData>(context);

    return Container(
      color: Color(0xff757575),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Add Task',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.lightBlueAccent, fontSize: 28),
              ),
              SizedBox(height: 30),
              TextField(
                textAlign: TextAlign.left,
                onChanged: (value) {
                  taskTitle = value;
                },
                autofocus: true,
                decoration: InputDecoration(
                  fillColor: Colors.blue.withOpacity(0.2),
                  prefixIcon: Icon(Icons.list),
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(width: 0, style: BorderStyle.none)),
                ),
              ),
              SizedBox(height: 30),
              FlatButton(
                padding: EdgeInsets.all(20),
                textColor: Colors.white,
                color: Colors.lightBlueAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                child: Text(
                  'ADD TASK',
                  style: TextStyle(fontSize: 15),
                ),
                onPressed: () {
                  provider.addTask(taskTitle);
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
