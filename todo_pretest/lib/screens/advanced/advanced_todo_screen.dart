import 'package:flutter/material.dart';
import '../../models/advanced_todo_model.dart';
import '../../widgets/advanced/advanced_todo_list.dart';
import '../../widgets/advanced/advanced_todo_empty_state.dart';
import 'advanced_todo_form_screen.dart';
import 'advanced_todo_detail_screen.dart';

class AdvancedTodoScreen extends StatefulWidget {
  const AdvancedTodoScreen({super.key});

  @override
  State<AdvancedTodoScreen> createState() => _AdvancedTodoScreenState();
}

class _AdvancedTodoScreenState extends State<AdvancedTodoScreen> {
  final List<AdvancedTodoModel> _todos = [];

  void _addOrUpdateTodo(AdvancedTodoModel todo) {
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

  Future<void> _openForm({AdvancedTodoModel? todo}) async {
    final result = await Navigator.push<AdvancedTodoModel>(
      context,
      MaterialPageRoute(
        builder: (context) => AdvancedTodoFormScreen(todo: todo),
      ),
    );
    if (result != null) {
      _addOrUpdateTodo(result);
    }
  }

  void _viewDetail(AdvancedTodoModel todo) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            AdvancedTodoDetailScreen(todo: todo, onUpdate: _addOrUpdateTodo),
      ),
    );
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
