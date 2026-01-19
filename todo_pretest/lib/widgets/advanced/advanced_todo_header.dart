import 'package:flutter/material.dart';
import '../../models/advanced_todo_model.dart';

class AdvancedTodoHeader extends StatelessWidget {
  final AdvancedTodoModel todo;

  const AdvancedTodoHeader({super.key, required this.todo});

  Color _getStatusColor() {
    if (todo.isCompleted) return Colors.green;
    final now = DateTime.now();
    if (todo.deadline.isBefore(now)) return Colors.red;
    if (todo.deadline.difference(now).inDays <= 1) return Colors.orange;
    return Colors.teal;
  }

  String _getStatusText() {
    if (todo.isCompleted) return 'Completed';
    final now = DateTime.now();
    if (todo.deadline.isBefore(now)) return 'Overdue';
    if (todo.deadline.difference(now).inDays <= 1) return 'Due Soon';
    return 'Pending';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.deepPurple.shade400, Colors.purple.shade300],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.deepPurple.withOpacity(0.3),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              todo.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: _getStatusColor(),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              _getStatusText(),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
