import 'package:flutter/material.dart';
import '../../models/categorized_todo_model.dart';
import '../../widgets/categorized/categorized_todo_input.dart';
import '../../widgets/categorized/categorized_todo_list.dart';
import '../../widgets/categorized/categorized_todo_empty_state.dart';

class CategorizedTodoScreen extends StatefulWidget {
  const CategorizedTodoScreen({super.key});

  @override
  State<CategorizedTodoScreen> createState() => _CategorizedTodoScreenState();
}

class _CategorizedTodoScreenState extends State<CategorizedTodoScreen> {
  final List<CategorizedTodoModel> _todos = [];
  final TextEditingController _textController = TextEditingController();
  TodoCategory _selectedCategory = TodoCategory.personal;

  void _addTodo() {
    final text = _textController.text.trim();
    if (text.isEmpty) return;

    setState(() {
      _todos.add(
        CategorizedTodoModel(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          title: text,
          category: _selectedCategory,
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

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade50,
      appBar: AppBar(
        title: const Text('Categorized To-Do'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          CategorizedTodoInput(
            controller: _textController,
            selectedCategory: _selectedCategory,
            onCategoryChanged: (category) =>
                setState(() => _selectedCategory = category),
            onAdd: _addTodo,
          ),
          Expanded(
            child: _todos.isEmpty
                ? const CategorizedTodoEmptyState()
                : CategorizedTodoList(
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
