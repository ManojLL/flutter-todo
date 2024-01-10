class ToDo{
  String? id;
  String? todo;
  bool isDone;

  ToDo({
    required this.id,
    required this.todo,
    this.isDone = false
  });

}