import 'package:flutter/material.dart';
import '../../models/priority_todo_model.dart';
import '../../widgets/priority/priority_todo_input.dart';
import '../../widgets/priority/priority_todo_list.dart';
import '../../widgets/priority/priority_todo_empty_state.dart';

class PriorityTodoScreen extends StatefulWidget {
  const PriorityTodoScreen({super.key});

  @override
  State<PriorityTodoScreen> createState() => _PriorityTodoScreenState();
}

class _PriorityTodoScreenState extends State<PriorityTodoScreen> {
  final List<PriorityTodoModel> _todos = [];
  final TextEditingController _textController = TextEditingController();
  TodoPriority _selectedPriority = TodoPriority.medium;

  void _addTodo() {
    final text = _textController.text.trim();
    if (text.isEmpty) return;

    setState(() {
      _todos.add(
        PriorityTodoModel(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          title: text,
          priority: _selectedPriority,
        ),
      );
    });
    _textController.clear();
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

  void _moveUp(int index) {
    if (index <= 0) return;
    setState(() {
      final item = _todos.removeAt(index);
      _todos.insert(index - 1, item);
    });
  }

  void _moveDown(int index) {
    if (index >= _todos.length - 1) return;
    setState(() {
      final item = _todos.removeAt(index);
      _todos.insert(index + 1, item);
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade50,
      appBar: AppBar(
        title: const Text('Priority To-Do'),
        backgroundColor: Colors.orange.shade700,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          PriorityTodoInput(
            controller: _textController,
            selectedPriority: _selectedPriority,
            onPriorityChanged: (priority) =>
                setState(() => _selectedPriority = priority),
            onAdd: _addTodo,
          ),
          Expanded(
            child: _todos.isEmpty
                ? const PriorityTodoEmptyState()
                : PriorityTodoList(
                    todos: _todos,
                    onToggle: _toggleTodo,
                    onDelete: _deleteTodo,
                    onMoveUp: _moveUp,
                    onMoveDown: _moveDown,
                  ),
          ),
        ],
      ),
    );
  }
}
