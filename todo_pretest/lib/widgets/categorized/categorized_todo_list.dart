import 'package:flutter/material.dart';
import '../../models/categorized_todo_model.dart';
import 'categorized_todo_item.dart';

class CategorizedTodoList extends StatelessWidget {
  final List<CategorizedTodoModel> todos;
  final Function(String) onToggle;
  final Function(String) onDelete;

  const CategorizedTodoList({
    super.key,
    required this.todos,
    required this.onToggle,
    required this.onDelete,
  });

  List<CategorizedTodoModel> _getTodosByCategory(TodoCategory category) {
    return todos.where((t) => t.category == category).toList();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: TodoCategory.values.length,
      itemBuilder: (context, index) {
        final category = TodoCategory.values[index];
        final categoryTodos = _getTodosByCategory(category);
        if (categoryTodos.isEmpty) return const SizedBox.shrink();

        return CategorizedTodoCategoryCard(
          category: category,
          todos: categoryTodos,
          onToggle: onToggle,
          onDelete: onDelete,
        );
      },
    );
  }
}

class CategorizedTodoCategoryCard extends StatelessWidget {
  final TodoCategory category;
  final List<CategorizedTodoModel> todos;
  final Function(String) onToggle;
  final Function(String) onDelete;

  const CategorizedTodoCategoryCard({
    super.key,
    required this.category,
    required this.todos,
    required this.onToggle,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.teal.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ExpansionTile(
        initiallyExpanded: true,
        leading: Text(category.icon, style: const TextStyle(fontSize: 24)),
        title: Text(
          '${category.displayName} (${todos.length})',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        children: todos.map((todo) {
          return CategorizedTodoItem(
            todo: todo,
            onToggle: () => onToggle(todo.id),
            onDelete: () => onDelete(todo.id),
          );
        }).toList(),
      ),
    );
  }
}
