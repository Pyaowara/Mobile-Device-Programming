import 'package:flutter/material.dart';

class SearchTodoResultsCount extends StatelessWidget {
  final int count;
  final String searchQuery;

  const SearchTodoResultsCount({
    super.key,
    required this.count,
    required this.searchQuery,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Text(
            '$count task${count == 1 ? '' : 's'} found',
            style: TextStyle(
              color: Colors.cyan.shade700,
              fontWeight: FontWeight.w500,
            ),
          ),
          if (searchQuery.isNotEmpty) ...[
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.cyan.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                '"$searchQuery"',
                style: TextStyle(fontSize: 12, color: Colors.cyan.shade800),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
