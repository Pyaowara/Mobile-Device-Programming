import 'package:flutter/material.dart';
import '../../models/advanced_todo_model.dart';

class AdvancedTodoItem extends StatelessWidget {
  final AdvancedTodoModel todo;
  final VoidCallback onTap;
  final VoidCallback onToggle;
  final VoidCallback onDelete;

  const AdvancedTodoItem({
    super.key,
    required this.todo,
    required this.onTap,
    required this.onToggle,
    required this.onDelete,
  });

  Color _getDeadlineColor() {
    final now = DateTime.now();
    final difference = todo.deadline.difference(now);

    if (todo.isCompleted) return Colors.green;
    if (difference.isNegative) return Colors.red;
    if (difference.inDays <= 1) return Colors.orange;
    return Colors.teal;
  }

  String _formatDeadline() {
    return '${todo.deadline.day}/${todo.deadline.month}/${todo.deadline.year} '
        '${todo.deadline.hour.toString().padLeft(2, '0')}:${todo.deadline.minute.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: todo.isCompleted
              ? [Colors.grey.shade300, Colors.grey.shade200]
              : [Colors.deepPurple.shade50, Colors.purple.shade50],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.deepPurple.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                GestureDetector(
                  onTap: onToggle,
                  child: Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: todo.isCompleted
                            ? Colors.green
                            : Colors.deepPurple,
                        width: 2,
                      ),
                      color: todo.isCompleted
                          ? Colors.green
                          : Colors.transparent,
                    ),
                    child: todo.isCompleted
                        ? const Icon(Icons.check, size: 18, color: Colors.white)
                        : null,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        todo.title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          decoration: todo.isCompleted
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                          color: todo.isCompleted
                              ? Colors.grey
                              : Colors.deepPurple.shade800,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        todo.description,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(
                            Icons.schedule,
                            size: 14,
                            color: _getDeadlineColor(),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            _formatDeadline(),
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: _getDeadlineColor(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.delete_outline, color: Colors.red.shade400),
                  onPressed: onDelete,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
