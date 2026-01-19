import 'package:flutter/material.dart';

// This widget shows when there are no todos
// It is STATELESS - just displays a message

class SimpleTodoEmptyState extends StatelessWidget {
  const SimpleTodoEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    // Center positions the child in the middle of available space
    return const Center(
      child: Text(
        'No tasks yet!\nAdd a task above.',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16, color: Colors.grey),
      ),
    );
  }
}
