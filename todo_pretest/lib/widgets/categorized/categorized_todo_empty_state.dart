import 'package:flutter/material.dart';

class CategorizedTodoEmptyState extends StatelessWidget {
  const CategorizedTodoEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.category, size: 60, color: Colors.teal.shade200),
          const SizedBox(height: 12),
          Text(
            'No tasks yet!',
            style: TextStyle(fontSize: 18, color: Colors.teal.shade300),
          ),
        ],
      ),
    );
  }
}
