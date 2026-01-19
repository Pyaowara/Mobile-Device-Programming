import 'package:flutter/material.dart';

class ValidatedTodoEmptyState extends StatelessWidget {
  const ValidatedTodoEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.verified_user_outlined,
            size: 80,
            color: Colors.amber.shade200,
          ),
          const SizedBox(height: 16),
          Text(
            'No tasks yet!',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.amber.shade300,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Tap + to add with validated form',
            style: TextStyle(fontSize: 14, color: Colors.grey.shade500),
          ),
        ],
      ),
    );
  }
}
