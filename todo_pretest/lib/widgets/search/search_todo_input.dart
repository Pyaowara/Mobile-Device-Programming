import 'package:flutter/material.dart';

class SearchTodoInput extends StatelessWidget {
  final TextEditingController searchController;
  final TextEditingController addController;
  final String searchQuery;
  final String filter;
  final Function(String) onSearchChanged;
  final Function(String) onFilterChanged;
  final VoidCallback onClearSearch;
  final VoidCallback onAdd;

  const SearchTodoInput({
    super.key,
    required this.searchController,
    required this.addController,
    required this.searchQuery,
    required this.filter,
    required this.onSearchChanged,
    required this.onFilterChanged,
    required this.onClearSearch,
    required this.onAdd,
  });

  Widget _buildFilterChip(String value, String label, IconData icon) {
    final isSelected = filter == value;
    return GestureDetector(
      onTap: () => onFilterChanged(value),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.white.withOpacity(0.3),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 16,
              color: isSelected ? Colors.cyan.shade700 : Colors.white,
            ),
            const SizedBox(width: 4),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.cyan.shade700 : Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.cyan.shade700,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: Column(
        children: [
          // Search bar
          TextField(
            controller: searchController,
            onChanged: onSearchChanged,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: 'Search tasks...',
              hintStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
              prefixIcon: Icon(
                Icons.search,
                color: Colors.white.withOpacity(0.7),
              ),
              suffixIcon: searchQuery.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.clear, color: Colors.white70),
                      onPressed: onClearSearch,
                    )
                  : null,
              filled: true,
              fillColor: Colors.white.withOpacity(0.2),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 12),
          // Add task bar
          TextField(
            controller: addController,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: 'Add a new task...',
              hintStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
              prefixIcon: Icon(Icons.add, color: Colors.white.withOpacity(0.7)),
              filled: true,
              fillColor: Colors.white.withOpacity(0.2),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              suffixIcon: IconButton(
                icon: const Icon(Icons.send, color: Colors.white),
                onPressed: onAdd,
              ),
            ),
            onSubmitted: (_) => onAdd(),
          ),
          const SizedBox(height: 12),
          // Filter chips
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildFilterChip('all', 'All', Icons.list),
              const SizedBox(width: 8),
              _buildFilterChip(
                'active',
                'Active',
                Icons.radio_button_unchecked,
              ),
              const SizedBox(width: 8),
              _buildFilterChip('completed', 'Done', Icons.check_circle),
            ],
          ),
        ],
      ),
    );
  }
}
