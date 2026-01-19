import 'package:flutter/material.dart';

class ValidatedTodoInfoBox extends StatelessWidget {
  const ValidatedTodoInfoBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.amber.shade100,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.amber.shade300),
      ),
      child: Row(
        children: [
          Icon(Icons.info_outline, color: Colors.amber.shade700),
          const SizedBox(width: 12),
          const Expanded(
            child: Text(
              'Fields marked with * are required. All inputs are validated before submission.',
              style: TextStyle(fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}
