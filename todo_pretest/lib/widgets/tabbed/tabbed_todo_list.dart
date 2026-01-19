import 'package:flutter/material.dart';
import '../../models/todo_model.dart';
import 'tabbed_todo_item.dart';
import 'tabbed_todo_empty_state.dart';

class TabbedTodoList extends StatelessWidget {
  final List<TodoModel> todos;
  final String emptyMessage;
  final Function(String) onToggle;
  final Function(String) onDelete;

  const TabbedTodoList({
    super.key,
    required this.todos,
    required this.emptyMessage,
    required this.onToggle,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    if (todos.isEmpty) {
      return TabbedTodoEmptyState(message: emptyMessage);
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final todo = todos[index];
        return TabbedTodoItem(
          todo: todo,
          onToggle: () => onToggle(todo.id),
          onDelete: () => onDelete(todo.id),
        );
      },
    );
  }
}
