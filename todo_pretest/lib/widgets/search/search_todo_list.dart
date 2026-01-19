import 'package:flutter/material.dart';
import '../../models/todo_model.dart';
import 'search_todo_item.dart';

class SearchTodoList extends StatelessWidget {
  final List<TodoModel> todos;
  final String searchQuery;
  final Function(String) onToggle;
  final Function(String) onDelete;

  const SearchTodoList({
    super.key,
    required this.todos,
    required this.searchQuery,
    required this.onToggle,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final todo = todos[index];
        return SearchTodoItem(
          todo: todo,
          searchQuery: searchQuery,
          onToggle: () => onToggle(todo.id),
          onDelete: () => onDelete(todo.id),
        );
      },
    );
  }
}
