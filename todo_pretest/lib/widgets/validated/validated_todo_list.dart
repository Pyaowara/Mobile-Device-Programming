import 'package:flutter/material.dart';
import '../../models/validated_todo_model.dart';
import 'validated_todo_item.dart';

class ValidatedTodoList extends StatelessWidget {
  final List<ValidatedTodoModel> todos;
  final Function(ValidatedTodoModel) onTap;
  final Function(String) onToggle;
  final Function(String) onDelete;

  const ValidatedTodoList({
    super.key,
    required this.todos,
    required this.onTap,
    required this.onToggle,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final todo = todos[index];
        return ValidatedTodoItem(
          todo: todo,
          onTap: () => onTap(todo),
          onToggle: () => onToggle(todo.id),
          onDelete: () => onDelete(todo.id),
        );
      },
    );
  }
}
