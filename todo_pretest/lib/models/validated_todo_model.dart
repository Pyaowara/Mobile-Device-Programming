class ValidatedTodoModel {
  final String id;
  String title;
  String description;
  String email;
  int priority; // 1-5
  DateTime dueDate;
  bool isCompleted;

  ValidatedTodoModel({
    required this.id,
    required this.title,
    required this.description,
    required this.email,
    required this.priority,
    required this.dueDate,
    this.isCompleted = false,
  });
}
