import 'package:flutter/material.dart';
import 'screens/simple/simple_todo_screen.dart';
import 'screens/advanced/advanced_todo_screen.dart';
import 'screens/categorized/categorized_todo_screen.dart';
import 'screens/priority/priority_todo_screen.dart';
import 'screens/tabbed/tabbed_todo_screen.dart';
import 'screens/search/search_todo_screen.dart';
import 'screens/validated/validated_todo_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do List App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final versions = [
      _VersionItem(
        title: 'Simple',
        subtitle: 'Quick tasks with checkbox',
        icon: Icons.check_box_outlined,
        color: Colors.blue,
        screen: const SimpleTodoScreen(),
      ),
      _VersionItem(
        title: 'Advanced',
        subtitle: 'Description & deadlines',
        icon: Icons.event_note,
        color: Colors.deepPurple,
        screen: const AdvancedTodoScreen(),
      ),
      _VersionItem(
        title: 'Categorized',
        subtitle: 'Group by category',
        icon: Icons.category,
        color: Colors.teal,
        screen: const CategorizedTodoScreen(),
      ),
      _VersionItem(
        title: 'Priority',
        subtitle: 'Move up/down manually',
        icon: Icons.low_priority,
        color: Colors.orange,
        screen: const PriorityTodoScreen(),
      ),
      _VersionItem(
        title: 'Tabbed',
        subtitle: 'All / Active / Done',
        icon: Icons.tab,
        color: Colors.pink,
        screen: const TabbedTodoScreen(),
      ),
      _VersionItem(
        title: 'Search & Filter',
        subtitle: 'Search with highlighting',
        icon: Icons.search,
        color: Colors.cyan.shade700,
        screen: const SearchTodoScreen(),
      ),
      _VersionItem(
        title: 'Validated Form',
        subtitle: 'Comprehensive validation',
        icon: Icons.verified_user,
        color: Colors.amber.shade700,
        screen: const ValidatedTodoScreen(),
      ),
    ];

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blue.shade400,
              Colors.purple.shade400,
              Colors.pink.shade300,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 24),
              const Icon(
                Icons.check_circle_outline,
                size: 60,
                color: Colors.white,
              ),
              const SizedBox(height: 12),
              const Text(
                'To-Do List App',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Choose a version (${versions.length} available)',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white.withOpacity(0.9),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemCount: versions.length,
                  itemBuilder: (context, index) {
                    final version = versions[index];
                    return _buildVersionCard(context, version, index + 1);
                  },
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVersionCard(
    BuildContext context,
    _VersionItem version,
    int number,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        elevation: 4,
        shadowColor: version.color.withOpacity(0.3),
        child: InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => version.screen),
          ),
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: version.color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(version.icon, color: version.color, size: 26),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: version.color.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              'V$number',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: version.color,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            version.title,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: version.color,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        version.subtitle,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.arrow_forward_ios, color: version.color, size: 18),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _VersionItem {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final Widget screen;

  _VersionItem({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.screen,
  });
}
