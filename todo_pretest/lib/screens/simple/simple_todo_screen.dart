import 'package:flutter/material.dart';
import '../../models/todo_model.dart';
import '../../widgets/simple/simple_todo_input.dart';
import '../../widgets/simple/simple_todo_list.dart';
import '../../widgets/simple/simple_todo_empty_state.dart';

// =============================================================================
// SIMPLE TODO SCREEN
// =============================================================================
// This is the MAIN SCREEN that displays the complete todo list app.
//
// WHY IS THIS STATEFUL?
// - We need to store and manage a list of todos
// - When we add, toggle, or delete a todo, the UI needs to rebuild
// - StatefulWidget lets us call setState() to trigger a UI rebuild
//
// All the child widgets (Input, List, Item, EmptyState) are STATELESS
// because they just display data - they don't manage any state themselves.
// =============================================================================

class SimpleTodoScreen extends StatefulWidget {
  const SimpleTodoScreen({super.key});

  @override
  State<SimpleTodoScreen> createState() => _SimpleTodoScreenState();
}

class _SimpleTodoScreenState extends State<SimpleTodoScreen> {
  // ============================================
  // STATE VARIABLES
  // ============================================
  // These are the data that can change over time

  // List to store all our todos
  final List<TodoModel> _todos = [];

  // Controller to manage the text input field
  final TextEditingController _textController = TextEditingController();

  // ============================================
  // METHODS (Functions)
  // ============================================

  // ADD a new todo to the list
  void _addTodo() {
    // Get the text and remove extra spaces
    final text = _textController.text.trim();

    // Don't add empty todos
    if (text.isEmpty) return;

    // setState tells Flutter to rebuild the UI
    setState(() {
      // Create a new todo and add it to the list
      _todos.add(
        TodoModel(
          id: DateTime.now().millisecondsSinceEpoch.toString(), // Unique ID
          title: text,
        ),
      );
    });

    // Clear the input field
    _textController.clear();
  }

  // TOGGLE a todo's completion status
  void _toggleTodo(String id) {
    setState(() {
      // Find the todo with this ID
      final todo = _todos.firstWhere((t) => t.id == id);
      // Flip its completion status
      todo.isCompleted = !todo.isCompleted;
    });
  }

  // DELETE a todo from the list
  void _deleteTodo(String id) {
    setState(() {
      // Remove the todo with this ID
      _todos.removeWhere((t) => t.id == id);
    });
  }

  // Clean up when the widget is removed
  @override
  void dispose() {
    _textController.dispose(); // Free up memory
    super.dispose();
  }

  // ============================================
  // BUILD METHOD - Creates the UI
  // ============================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App bar at the top
      appBar: AppBar(
        title: const Text('Simple To-Do'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      // Body of the screen
      body: Column(
        children: [
          // Input widget at the top
          SimpleTodoInput(controller: _textController, onAdd: _addTodo),

          // List takes up remaining space
          // Expanded makes the child fill available space
          Expanded(
            // Show empty state OR the list based on todos count
            child: _todos.isEmpty
                ? const SimpleTodoEmptyState()
                : SimpleTodoList(
                    todos: _todos,
                    onToggle: _toggleTodo,
                    onDelete: _deleteTodo,
                  ),
          ),
        ],
      ),
    );
  }
}
