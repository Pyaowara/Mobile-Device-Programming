import 'package:flutter/material.dart';
import '../../models/validated_todo_model.dart';
import '../../widgets/validated/validated_todo_list.dart';
import '../../widgets/validated/validated_todo_empty_state.dart';
import 'validated_todo_form_screen.dart';

class ValidatedTodoScreen extends StatefulWidget {
  const ValidatedTodoScreen({super.key});

  @override
  State<ValidatedTodoScreen> createState() => _ValidatedTodoScreenState();
}

class _ValidatedTodoScreenState extends State<ValidatedTodoScreen> {
  final List<ValidatedTodoModel> _todos = [];

  void _addOrUpdateTodo(ValidatedTodoModel todo) {
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

  Future<void> _openForm({ValidatedTodoModel? todo}) async {
    final result = await Navigator.push<ValidatedTodoModel>(
      context,
      MaterialPageRoute(
        builder: (context) => ValidatedTodoFormScreen(todo: todo),
      ),
    );
    if (result != null) {
      _addOrUpdateTodo(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade50,
      appBar: AppBar(
        title: const Text('Validated Form To-Do'),
        backgroundColor: Colors.amber.shade700,
        foregroundColor: Colors.white,
      ),
      body: _todos.isEmpty
          ? const ValidatedTodoEmptyState()
          : ValidatedTodoList(
              todos: _todos,
              onTap: (todo) => _openForm(todo: todo),
              onToggle: _toggleTodo,
              onDelete: _deleteTodo,
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openForm(),
        backgroundColor: Colors.amber.shade700,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
