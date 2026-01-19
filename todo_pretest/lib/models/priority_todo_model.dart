enum TodoPriority { high, medium, low }

extension TodoPriorityExtension on TodoPriority {
  String get displayName {
    switch (this) {
      case TodoPriority.high:
        return 'High';
      case TodoPriority.medium:
        return 'Medium';
      case TodoPriority.low:
        return 'Low';
    }
  }

  int get sortOrder {
    switch (this) {
      case TodoPriority.high:
        return 0;
      case TodoPriority.medium:
        return 1;
      case TodoPriority.low:
        return 2;
    }
  }
}

class PriorityTodoModel {
  final String id;
  final String title;
  TodoPriority priority;
  bool isCompleted;

  PriorityTodoModel({
    required this.id,
    required this.title,
    required this.priority,
    this.isCompleted = false,
  });
}
