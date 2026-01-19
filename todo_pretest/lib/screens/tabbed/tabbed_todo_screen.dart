import 'package:flutter/material.dart';
import '../../models/todo_model.dart';
import '../../widgets/tabbed/tabbed_todo_input.dart';
import '../../widgets/tabbed/tabbed_todo_list.dart';

class TabbedTodoScreen extends StatefulWidget {
  const TabbedTodoScreen({super.key});

  @override
  State<TabbedTodoScreen> createState() => _TabbedTodoScreenState();
}

class _TabbedTodoScreenState extends State<TabbedTodoScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<TodoModel> _todos = [];
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _textController.dispose();
    super.dispose();
  }

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

  List<TodoModel> get _allTodos => _todos;
  List<TodoModel> get _activeTodos =>
      _todos.where((t) => !t.isCompleted).toList();
  List<TodoModel> get _completedTodos =>
      _todos.where((t) => t.isCompleted).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      appBar: AppBar(
        title: const Text('Tabbed To-Do'),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          indicatorWeight: 3,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white60,
          tabs: [
            Tab(text: 'All (${_allTodos.length})'),
            Tab(text: 'Active (${_activeTodos.length})'),
            Tab(text: 'Done (${_completedTodos.length})'),
          ],
        ),
      ),
      body: Column(
        children: [
          TabbedTodoInput(controller: _textController, onAdd: _addTodo),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                TabbedTodoList(
                  todos: _allTodos,
                  emptyMessage: 'No tasks yet!',
                  onToggle: _toggleTodo,
                  onDelete: _deleteTodo,
                ),
                TabbedTodoList(
                  todos: _activeTodos,
                  emptyMessage: 'No active tasks!',
                  onToggle: _toggleTodo,
                  onDelete: _deleteTodo,
                ),
                TabbedTodoList(
                  todos: _completedTodos,
                  emptyMessage: 'No completed tasks!',
                  onToggle: _toggleTodo,
                  onDelete: _deleteTodo,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
