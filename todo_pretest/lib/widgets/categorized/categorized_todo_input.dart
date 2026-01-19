import 'package:flutter/material.dart';
import '../../models/categorized_todo_model.dart';

class CategorizedTodoInput extends StatelessWidget {
  final TextEditingController controller;
  final TodoCategory selectedCategory;
  final Function(TodoCategory) onCategoryChanged;
  final VoidCallback onAdd;

  const CategorizedTodoInput({
    super.key,
    required this.controller,
    required this.selectedCategory,
    required this.onCategoryChanged,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.teal,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
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
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                  ),
                  onSubmitted: (_) => onAdd(),
                ),
              ),
              const SizedBox(width: 8),
              IconButton(
                onPressed: onAdd,
                icon: const Icon(Icons.add_circle, size: 40),
                color: Colors.white,
              ),
            ],
          ),
          const SizedBox(height: 12),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: TodoCategory.values.map((category) {
                final isSelected = category == selectedCategory;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ChoiceChip(
                    label: Text('${category.icon} ${category.displayName}'),
                    selected: isSelected,
                    onSelected: (_) => onCategoryChanged(category),
                    selectedColor: Colors.white,
                    backgroundColor: Colors.white.withOpacity(0.3),
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.teal : Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
