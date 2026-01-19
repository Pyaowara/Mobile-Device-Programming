import 'package:flutter/material.dart';
import '../../models/priority_todo_model.dart';
import 'priority_todo_item.dart';

class PriorityTodoList extends StatelessWidget {
  final List<PriorityTodoModel> todos;
  final Function(String) onToggle;
  final Function(String) onDelete;
  final Function(int) onMoveUp;
  final Function(int) onMoveDown;

  const PriorityTodoList({
    super.key,
    required this.todos,
    required this.onToggle,
    required this.onDelete,
    required this.onMoveUp,
    required this.onMoveDown,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final todo = todos[index];
        return PriorityTodoItem(
          todo: todo,
          onToggle: () => onToggle(todo.id),
          onDelete: () => onDelete(todo.id),
          onMoveUp: () => onMoveUp(index),
          onMoveDown: () => onMoveDown(index),
          canMoveUp: index > 0,
          canMoveDown: index < todos.length - 1,
        );
      },
    );
  }
}
