import 'package:flutter/material.dart';

class PriorityTodoEmptyState extends StatelessWidget {
  const PriorityTodoEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.low_priority, size: 60, color: Colors.orange.shade200),
          const SizedBox(height: 12),
          Text(
            'No tasks yet!',
            style: TextStyle(fontSize: 18, color: Colors.orange.shade300),
          ),
          const SizedBox(height: 4),
          Text(
            'Use arrows to move tasks',
            style: TextStyle(fontSize: 14, color: Colors.grey.shade500),
          ),
        ],
      ),
    );
  }
}
