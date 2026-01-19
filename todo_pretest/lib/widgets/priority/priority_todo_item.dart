import 'package:flutter/material.dart';
import '../../models/priority_todo_model.dart';

class PriorityTodoItem extends StatelessWidget {
  final PriorityTodoModel todo;
  final VoidCallback onToggle;
  final VoidCallback onDelete;
  final VoidCallback onMoveUp;
  final VoidCallback onMoveDown;
  final bool canMoveUp;
  final bool canMoveDown;

  const PriorityTodoItem({
    super.key,
    required this.todo,
    required this.onToggle,
    required this.onDelete,
    required this.onMoveUp,
    required this.onMoveDown,
    required this.canMoveUp,
    required this.canMoveDown,
  });

  Color _getPriorityColor(TodoPriority priority) {
    switch (priority) {
      case TodoPriority.high:
        return Colors.red;
      case TodoPriority.medium:
        return Colors.orange;
      case TodoPriority.low:
        return Colors.green;
    }
  }

  IconData _getPriorityIcon(TodoPriority priority) {
    switch (priority) {
      case TodoPriority.high:
        return Icons.keyboard_double_arrow_up;
      case TodoPriority.medium:
        return Icons.drag_handle;
      case TodoPriority.low:
        return Icons.keyboard_double_arrow_down;
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = _getPriorityColor(todo.priority);

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3), width: 2),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Row(
          children: [
            // Move up/down buttons
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_upward,
                    color: canMoveUp ? color : Colors.grey.shade300,
                    size: 20,
                  ),
                  onPressed: canMoveUp ? onMoveUp : null,
                  constraints: const BoxConstraints(
                    minHeight: 32,
                    minWidth: 32,
                  ),
                  padding: EdgeInsets.zero,
                ),
                IconButton(
                  icon: Icon(
                    Icons.arrow_downward,
                    color: canMoveDown ? color : Colors.grey.shade300,
                    size: 20,
                  ),
                  onPressed: canMoveDown ? onMoveDown : null,
                  constraints: const BoxConstraints(
                    minHeight: 32,
                    minWidth: 32,
                  ),
                  padding: EdgeInsets.zero,
                ),
              ],
            ),
            const SizedBox(width: 4),
            // Priority icon
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                _getPriorityIcon(todo.priority),
                color: color,
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    todo.title,
                    style: TextStyle(
                      decoration: todo.isCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      color: todo.isCompleted ? Colors.grey : Colors.black87,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    todo.priority.displayName,
                    style: TextStyle(color: color, fontSize: 12),
                  ),
                ],
              ),
            ),
            // Actions
            Checkbox(
              value: todo.isCompleted,
              onChanged: (_) => onToggle(),
              activeColor: color,
            ),
            IconButton(
              icon: Icon(Icons.delete_outline, color: Colors.red.shade300),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}
