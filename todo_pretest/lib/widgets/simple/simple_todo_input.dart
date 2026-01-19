import 'package:flutter/material.dart';

// This widget shows the input field and add button
// It is STATELESS - the parent manages the text controller

class SimpleTodoInput extends StatelessWidget {
  // Properties passed from the parent
  final TextEditingController controller; // Controls the text field
  final VoidCallback onAdd; // Function to call when Add is pressed

  const SimpleTodoInput({
    super.key,
    required this.controller,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    // Padding adds space around the child widget
    return Padding(
      padding: const EdgeInsets.all(16.0),
      // Row arranges children horizontally
      child: Row(
        children: [
          // Expanded makes the TextField take up remaining space
          Expanded(
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: 'Enter a task...',
                border: OutlineInputBorder(),
              ),
              // When user presses Enter, add the todo
              onSubmitted: (value) => onAdd(),
            ),
          ),

          // SizedBox adds fixed space between widgets
          const SizedBox(width: 8),

          // Add button
          ElevatedButton(onPressed: onAdd, child: const Text('Add')),
        ],
      ),
    );
  }
}
