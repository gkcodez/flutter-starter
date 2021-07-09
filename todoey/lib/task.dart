class Task {
  int taskId;
  String name;
  int isDone;
  Task(int id, String name, int isDone) {
    this.taskId = id;
    this.name = name;
    this.isDone = isDone;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': taskId,
      'name': name,
      'isDone': isDone,
    };
  }
}
