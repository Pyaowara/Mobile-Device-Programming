import 'package:flutter/material.dart';

class ValidatedTodoPrioritySlider extends StatelessWidget {
  final int priority;
  final ValueChanged<int> onChanged;

  const ValidatedTodoPrioritySlider({
    super.key,
    required this.priority,
    required this.onChanged,
  });

  Color _getPriorityColor(int priority) {
    switch (priority) {
      case 1:
        return Colors.green;
      case 2:
        return Colors.lightGreen;
      case 3:
        return Colors.amber;
      case 4:
        return Colors.orange;
      case 5:
        return Colors.red;
      default:
        return Colors.amber;
    }
  }

  String _getPriorityLabel(int priority) {
    switch (priority) {
      case 1:
        return 'Very Low';
      case 2:
        return 'Low';
      case 3:
        return 'Medium';
      case 4:
        return 'High';
      case 5:
        return 'Critical';
      default:
        return 'Medium';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12, top: 12),
          child: Row(
            children: [
              Icon(Icons.flag, color: Colors.amber.shade700),
              const SizedBox(width: 12),
              Text(
                'Priority Level: $priority',
                style: const TextStyle(fontSize: 16),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: _getPriorityColor(priority),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  _getPriorityLabel(priority),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
        Slider(
          value: priority.toDouble(),
          min: 1,
          max: 5,
          divisions: 4,
          activeColor: _getPriorityColor(priority),
          label: _getPriorityLabel(priority),
          onChanged: (value) => onChanged(value.round()),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Low', style: TextStyle(fontSize: 12, color: Colors.grey)),
              Text('High', style: TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
