import 'package:flutter/material.dart';

class TabbedTodoEmptyState extends StatelessWidget {
  final String message;

  const TabbedTodoEmptyState({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.inbox_outlined, size: 60, color: Colors.pink.shade200),
          const SizedBox(height: 12),
          Text(
            message,
            style: TextStyle(fontSize: 16, color: Colors.pink.shade300),
          ),
        ],
      ),
    );
  }
}
