/// The structure of the Task Object

class Todo {
  int? id; //This is the primary key

  String tag;

  String task; // For example, "Buy milk"

  String? sender;

  bool isDone; // This is the checkbox state

  Todo({
    this.id,
    this.tag = '',
    required this.task,
    this.sender = '',
    this.isDone = false,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'tag': tag,
        'task': task,
        'isDone': isDone,
        'sender': sender,
      };
}
