import 'package:flutter/material.dart';
import '../../models/advanced_todo_model.dart';
import '../../widgets/advanced/advanced_todo_header.dart';
import '../../widgets/advanced/advanced_todo_info_card.dart';
import 'advanced_todo_form_screen.dart';

class AdvancedTodoDetailScreen extends StatelessWidget {
  final AdvancedTodoModel todo;
  final Function(AdvancedTodoModel) onUpdate;

  const AdvancedTodoDetailScreen({
    super.key,
    required this.todo,
    required this.onUpdate,
  });

  String _formatDeadline() {
    return '${todo.deadline.day}/${todo.deadline.month}/${todo.deadline.year} '
        'at ${todo.deadline.hour.toString().padLeft(2, '0')}:${todo.deadline.minute.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Task Details'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () async {
              final result = await Navigator.push<AdvancedTodoModel>(
                context,
                MaterialPageRoute(
                  builder: (context) => AdvancedTodoFormScreen(todo: todo),
                ),
              );
              if (result != null) {
                onUpdate(result);
                if (context.mounted) Navigator.pop(context);
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AdvancedTodoHeader(todo: todo),
            const SizedBox(height: 24),
            AdvancedTodoInfoCard(
              icon: Icons.description,
              title: 'Description',
              content: todo.description,
            ),
            const SizedBox(height: 16),
            AdvancedTodoInfoCard(
              icon: Icons.schedule,
              title: 'Deadline',
              content: _formatDeadline(),
            ),
          ],
        ),
      ),
    );
  }
}
