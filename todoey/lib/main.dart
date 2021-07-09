import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:gktodo/screens/tasks_screen.dart';
import 'package:gktodo/task_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp(
        theme: ThemeData(fontFamily: 'Roboto'),
        home: TasksScreen(),
      ),
    );
  }
}
