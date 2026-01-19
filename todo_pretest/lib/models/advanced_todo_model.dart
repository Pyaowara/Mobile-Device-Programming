class AdvancedTodoModel {
  final String id;
  String title;
  String description;
  DateTime deadline;
  bool isCompleted;

  AdvancedTodoModel({
    required this.id,
    required this.title,
    required this.description,
    required this.deadline,
    this.isCompleted = false,
  });
}
