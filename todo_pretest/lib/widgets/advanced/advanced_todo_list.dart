import 'package:flutter/material.dart';
import '../../models/advanced_todo_model.dart';
import 'advanced_todo_item.dart';

class AdvancedTodoList extends StatelessWidget {
  final List<AdvancedTodoModel> todos;
  final Function(AdvancedTodoModel) onTap;
  final Function(String) onToggle;
  final Function(String) onDelete;

  const AdvancedTodoList({
    super.key,
    required this.todos,
    required this.onTap,
    required this.onToggle,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 12),
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final todo = todos[index];
        return AdvancedTodoItem(
          todo: todo,
          onTap: () => onTap(todo),
          onToggle: () => onToggle(todo.id),
          onDelete: () => onDelete(todo.id),
        );
      },
    );
  }
}
