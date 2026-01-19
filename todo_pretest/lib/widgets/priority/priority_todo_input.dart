import 'package:flutter/material.dart';
import '../../models/priority_todo_model.dart';

class PriorityTodoInput extends StatelessWidget {
  final TextEditingController controller;
  final TodoPriority selectedPriority;
  final Function(TodoPriority) onPriorityChanged;
  final VoidCallback onAdd;

  const PriorityTodoInput({
    super.key,
    required this.controller,
    required this.selectedPriority,
    required this.onPriorityChanged,
    required this.onAdd,
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
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.orange.shade700,
      child: Column(
        children: [
          TextField(
            controller: controller,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: 'Add a task...',
              hintStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
              filled: true,
              fillColor: Colors.white.withOpacity(0.2),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              suffixIcon: IconButton(
                icon: const Icon(Icons.add, color: Colors.white),
                onPressed: onAdd,
              ),
            ),
            onSubmitted: (_) => onAdd(),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: TodoPriority.values.map((priority) {
              final isSelected = priority == selectedPriority;
              final color = _getPriorityColor(priority);
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: GestureDetector(
                  onTap: () => onPriorityChanged(priority),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? Colors.white
                          : Colors.white.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: isSelected ? color : Colors.transparent,
                        width: 2,
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          _getPriorityIcon(priority),
                          size: 18,
                          color: isSelected ? color : Colors.white,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          priority.displayName,
                          style: TextStyle(
                            color: isSelected ? color : Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
