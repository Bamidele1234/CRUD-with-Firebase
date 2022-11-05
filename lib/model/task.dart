/// The structure of the Task Object

class Todo {
  int? id; //This is the primary key

  String task; // For example, "Buy milk"

  bool isDone; // This is the checkbox state

  Todo({
    this.id,
    required this.task,
    this.isDone = false,
  });
}
