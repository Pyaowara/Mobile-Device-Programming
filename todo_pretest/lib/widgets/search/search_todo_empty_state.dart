import 'package:flutter/material.dart';

class SearchTodoEmptyState extends StatelessWidget {
  final bool hasSearchQuery;

  const SearchTodoEmptyState({super.key, required this.hasSearchQuery});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search_off, size: 60, color: Colors.cyan.shade200),
          const SizedBox(height: 12),
          Text(
            hasSearchQuery ? 'No matching tasks' : 'No tasks yet!',
            style: TextStyle(fontSize: 18, color: Colors.cyan.shade300),
          ),
        ],
      ),
    );
  }
}
