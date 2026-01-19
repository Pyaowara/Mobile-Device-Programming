import 'package:flutter/material.dart';
import '../../models/categorized_todo_model.dart';

class CategorizedTodoItem extends StatelessWidget {
  final CategorizedTodoModel todo;
  final VoidCallback onToggle;
  final VoidCallback onDelete;

  const CategorizedTodoItem({
    super.key,
    required this.todo,
    required this.onToggle,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: todo.isCompleted,
        onChanged: (_) => onToggle(),
        activeColor: Colors.teal,
      ),
      title: Text(
        todo.title,
        style: TextStyle(
          decoration: todo.isCompleted
              ? TextDecoration.lineThrough
              : TextDecoration.none,
          color: todo.isCompleted ? Colors.grey : Colors.black87,
        ),
      ),
      trailing: IconButton(
        icon: Icon(Icons.delete_outline, color: Colors.red.shade300),
        onPressed: onDelete,
      ),
    );
  }
}
