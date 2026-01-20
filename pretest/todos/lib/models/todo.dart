class Todo {
  final int? id;
  final String title;
  final String description;
  final bool isCompleted;

  Todo({
    this.id,
    required this.title,
    required this.description,
    this.isCompleted = false,
  });

  // Convert Todo to Map for SQLite insertion
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'isCompleted': isCompleted ? 1 : 0,
    };
  }

  // Create Todo from Map retrieved from SQLite
  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      id: map['id'] as int,
      title: map['title'] as String,
      description: map['description'] as String,
      isCompleted: map['isCompleted'] == 1,
    );
  }

  // Create a copy of Todo with updated fields
  Todo copyWith({
    int? id,
    String? title,
    String? description,
    bool? isCompleted,
  }) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
