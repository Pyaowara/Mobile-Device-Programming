import 'package:flutter/material.dart';
import '../../models/todo_model.dart';

// This widget displays a SINGLE todo item in the list
// It is STATELESS because it doesn't manage its own state
// The parent widget tells it what to display and what to do when clicked

class SimpleTodoItem extends StatelessWidget {
  // Properties passed from the parent widget
  final TodoModel todo; // The todo data to display
  final VoidCallback onToggle; // Function to call when checkbox is tapped
  final VoidCallback onDelete; // Function to call when delete is tapped

  // Constructor - receives data and callbacks from parent
  const SimpleTodoItem({
    super.key,
    required this.todo,
    required this.onToggle,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    // Card widget creates a nice elevated container
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: ListTile(
        // Leading = left side of the list tile
        // Checkbox shows completion status
        leading: Checkbox(
          value: todo.isCompleted,
          onChanged: (value) => onToggle(), // Call parent's toggle function
        ),

        // Title = main content of the list tile
        title: Text(
          todo.title,
          style: TextStyle(
            // If completed, add strikethrough decoration
            decoration: todo.isCompleted
                ? TextDecoration.lineThrough
                : TextDecoration.none,
            // If completed, make text grey
            color: todo.isCompleted ? Colors.grey : Colors.black,
          ),
        ),

        // Trailing = right side of the list tile
        // Delete button
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: onDelete, // Call parent's delete function
        ),
      ),
    );
  }
}
