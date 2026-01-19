import 'package:flutter/material.dart';
import '../../models/todo_model.dart';
import 'simple_todo_item.dart';

// This widget displays the list of todos
// It is STATELESS - the parent provides the data and callbacks

class SimpleTodoList extends StatelessWidget {
  // Properties passed from parent
  final List<TodoModel> todos; // List of todos to display
  final Function(String) onToggle; // Callback when checkbox is tapped
  final Function(String) onDelete; // Callback when delete is tapped

  const SimpleTodoList({
    super.key,
    required this.todos,
    required this.onToggle,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    // ListView.builder efficiently creates list items as needed
    // It only builds visible items, which is great for long lists
    return ListView.builder(
      itemCount: todos.length, // How many items in the list
      itemBuilder: (context, index) {
        // Get the todo at this index
        final todo = todos[index];

        // Return a SimpleTodoItem widget for each todo
        return SimpleTodoItem(
          todo: todo,
          onToggle: () => onToggle(todo.id), // Pass the todo's ID
          onDelete: () => onDelete(todo.id), // Pass the todo's ID
        );
      },
    );
  }
}
