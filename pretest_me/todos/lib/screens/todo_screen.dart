import 'package:flutter/material.dart';
import '../models/todo.dart';
import 'todo_form.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final List<TodoModel> _todos = [];
  void _addOrUpdateTodo(TodoModel todo) {
    setState(() {
      final index = _todos.indexWhere((t) => t.id == todo.id);
      if (index >= 0) {
        _todos[index] = todo;
      } else {
        _todos.add(todo);
      }
    });
  }

  void _toggleTodo(String id) {
    setState(() {
      final todo = _todos.firstWhere((t) => t.id == id);
      todo.isCompleted = !todo.isCompleted;
    });
  }

  void _deleteTodo(String id) {
    setState(() {
      _todos.removeWhere((t) => t.id == id);
    });
  }

  Future<void> _openForm({TodoModel? todo}) async {
    final result = await Navigator.push<TodoModel>(
      context,
      MaterialPageRoute(
        builder: (context) => TodoForm(todo: todo),
      ),
    );
    if (result != null) {
      _addOrUpdateTodo(result);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Advanced To-Do'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: _todos.isEmpty
          ? const AdvancedTodoEmptyState()
          : AdvancedTodoList(
              todos: _todos,
              onTap: _viewDetail,
              onToggle: _toggleTodo,
              onDelete: _deleteTodo,
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openForm(),
        backgroundColor: Colors.deepPurple,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
