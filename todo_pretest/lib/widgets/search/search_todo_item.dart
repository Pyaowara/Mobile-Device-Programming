import 'package:flutter/material.dart';
import '../../models/todo_model.dart';

class SearchTodoItem extends StatelessWidget {
  final TodoModel todo;
  final String searchQuery;
  final VoidCallback onToggle;
  final VoidCallback onDelete;

  const SearchTodoItem({
    super.key,
    required this.todo,
    required this.searchQuery,
    required this.onToggle,
    required this.onDelete,
  });

  Widget _highlightMatch(String text) {
    if (searchQuery.isEmpty) {
      return Text(text);
    }

    final lowerText = text.toLowerCase();
    final lowerQuery = searchQuery.toLowerCase();
    final startIndex = lowerText.indexOf(lowerQuery);

    if (startIndex == -1) {
      return Text(text);
    }

    return RichText(
      text: TextSpan(
        style: const TextStyle(color: Colors.black87),
        children: [
          TextSpan(text: text.substring(0, startIndex)),
          TextSpan(
            text: text.substring(startIndex, startIndex + searchQuery.length),
            style: TextStyle(
              backgroundColor: Colors.yellow.shade200,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(text: text.substring(startIndex + searchQuery.length)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.cyan.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        leading: GestureDetector(
          onTap: onToggle,
          child: Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: todo.isCompleted ? Colors.cyan : Colors.transparent,
              border: Border.all(color: Colors.cyan, width: 2),
            ),
            child: todo.isCompleted
                ? const Icon(Icons.check, size: 14, color: Colors.white)
                : null,
          ),
        ),
        title: _highlightMatch(todo.title),
        trailing: IconButton(
          icon: Icon(Icons.delete_outline, color: Colors.red.shade300),
          onPressed: onDelete,
        ),
      ),
    );
  }
}
