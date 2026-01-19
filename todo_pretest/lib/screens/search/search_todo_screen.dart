import 'package:flutter/material.dart';
import '../../models/todo_model.dart';
import '../../widgets/search/search_todo_input.dart';
import '../../widgets/search/search_todo_list.dart';
import '../../widgets/search/search_todo_empty_state.dart';
import '../../widgets/search/search_todo_results_count.dart';

class SearchTodoScreen extends StatefulWidget {
  const SearchTodoScreen({super.key});

  @override
  State<SearchTodoScreen> createState() => _SearchTodoScreenState();
}

class _SearchTodoScreenState extends State<SearchTodoScreen> {
  final List<TodoModel> _todos = [];
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  String _filter = 'all';

  void _addTodo() {
    final text = _textController.text.trim();
    if (text.isEmpty) return;

    setState(() {
      _todos.add(
        TodoModel(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          title: text,
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

  List<TodoModel> get _filteredTodos {
    var result = _todos.toList();

    if (_filter == 'active') {
      result = result.where((t) => !t.isCompleted).toList();
    } else if (_filter == 'completed') {
      result = result.where((t) => t.isCompleted).toList();
    }

    if (_searchQuery.isNotEmpty) {
      result = result
          .where(
            (t) => t.title.toLowerCase().contains(_searchQuery.toLowerCase()),
          )
          .toList();
    }

    return result;
  }

  @override
  void dispose() {
    _textController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filtered = _filteredTodos;

    return Scaffold(
      backgroundColor: Colors.cyan.shade50,
      appBar: AppBar(
        title: const Text('Search & Filter'),
        backgroundColor: Colors.cyan.shade700,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          SearchTodoInput(
            searchController: _searchController,
            addController: _textController,
            searchQuery: _searchQuery,
            filter: _filter,
            onSearchChanged: (value) => setState(() => _searchQuery = value),
            onFilterChanged: (value) => setState(() => _filter = value),
            onClearSearch: () {
              setState(() {
                _searchController.clear();
                _searchQuery = '';
              });
            },
            onAdd: _addTodo,
          ),
          SearchTodoResultsCount(
            count: filtered.length,
            searchQuery: _searchQuery,
          ),
          Expanded(
            child: filtered.isEmpty
                ? SearchTodoEmptyState(hasSearchQuery: _searchQuery.isNotEmpty)
                : SearchTodoList(
                    todos: filtered,
                    searchQuery: _searchQuery,
                    onToggle: _toggleTodo,
                    onDelete: _deleteTodo,
                  ),
          ),
        ],
      ),
    );
  }
}
