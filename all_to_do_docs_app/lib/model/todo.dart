class ToDo {
  String? id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ToDo && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  static List<ToDo> todoList() {
    return [
      ToDo(id: '01', todoText: 'Morning Exercise', isDone: true),
      ToDo(id: '02', todoText: 'Eating breakfast', isDone: true),
      ToDo(id: '03', todoText: 'Check Email or any text'),
      ToDo(id: '04', todoText: 'Go to class or Library'),
      ToDo(id: '05', todoText: 'Work on Mobile apps for 2 hours'),
      ToDo(id: '06', todoText: 'Dinner With friends'),
    ];
  }
}
