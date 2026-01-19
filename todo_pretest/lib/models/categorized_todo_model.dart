enum TodoCategory { work, personal, shopping, health, other }

extension TodoCategoryExtension on TodoCategory {
  String get displayName {
    switch (this) {
      case TodoCategory.work:
        return 'Work';
      case TodoCategory.personal:
        return 'Personal';
      case TodoCategory.shopping:
        return 'Shopping';
      case TodoCategory.health:
        return 'Health';
      case TodoCategory.other:
        return 'Other';
    }
  }

  String get icon {
    switch (this) {
      case TodoCategory.work:
        return '💼';
      case TodoCategory.personal:
        return '👤';
      case TodoCategory.shopping:
        return '🛒';
      case TodoCategory.health:
        return '❤️';
      case TodoCategory.other:
        return '📌';
    }
  }
}

class CategorizedTodoModel {
  final String id;
  final String title;
  final TodoCategory category;
  bool isCompleted;

  CategorizedTodoModel({
    required this.id,
    required this.title,
    required this.category,
    this.isCompleted = false,
  });
}
