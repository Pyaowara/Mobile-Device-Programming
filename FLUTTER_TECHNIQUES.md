# Flutter Techniques Summary

A comprehensive summary of all Flutter techniques used across this Mobile Device Programming course.

---

## 📱 Core Flutter Concepts

### Widget Types
| Widget Type | Description | Example Usage |
|-------------|-------------|---------------|
| `StatelessWidget` | Immutable UI components | Simple screens, reusable cards |
| `StatefulWidget` | Mutable UI with internal state | Forms, counters, todo lists |

### State Management
- **`setState()`** - Trigger UI rebuild when state changes
- **`initState()`** - Initialize state when widget is created
- **`dispose()`** - Clean up resources (controllers, listeners)

---

## 🎨 UI Components & Layouts

### Layout Widgets

#### Column - Vertical Arrangement
```dart
Column(
  mainAxisAlignment: MainAxisAlignment.center,    // Vertical alignment
  crossAxisAlignment: CrossAxisAlignment.start,  // Horizontal alignment
  children: [
    Text('First item'),
    Text('Second item'),
    Text('Third item'),
  ],
)
```

#### Row - Horizontal Arrangement
```dart
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,  // Horizontal spacing
  crossAxisAlignment: CrossAxisAlignment.center,     // Vertical alignment
  children: [
    Icon(Icons.star),
    Icon(Icons.star),
    Icon(Icons.star),
  ],
)
```

#### Expanded - Flexible Space Filling
```dart
Row(
  children: [
    Expanded(
      flex: 2,  // Takes 2/3 of available space
      child: Container(color: Colors.blue),
    ),
    Expanded(
      flex: 1,  // Takes 1/3 of available space
      child: Container(color: Colors.red),
    ),
  ],
)
```

#### Padding - Add Spacing Around Widgets
```dart
Padding(
  padding: EdgeInsets.all(16.0),              // All sides
  // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  // padding: EdgeInsets.only(left: 8, top: 16),
  child: Text('Padded text'),
)
```

#### SizedBox - Fixed-Size Spacing
```dart
Column(
  children: [
    Text('Above'),
    SizedBox(height: 20),  // Vertical spacing
    Text('Below'),
  ],
)

Row(
  children: [
    Text('Left'),
    SizedBox(width: 10),   // Horizontal spacing
    Text('Right'),
  ],
)
```

#### Container - Box Model with Decoration
```dart
Container(
  width: 200,
  height: 100,
  padding: EdgeInsets.all(16),
  margin: EdgeInsets.symmetric(vertical: 8),
  decoration: BoxDecoration(
    color: Colors.blue,
    borderRadius: BorderRadius.circular(12),
    boxShadow: [
      BoxShadow(
        color: Colors.black26,
        blurRadius: 10,
        offset: Offset(0, 4),
      ),
    ],
  ),
  child: Text('Styled Container'),
)
```

#### Center - Center Child Widget
```dart
Center(
  child: Text('I am centered!'),
)

// Can also use widthFactor/heightFactor
Center(
  widthFactor: 1.5,
  heightFactor: 2.0,
  child: Container(width: 100, height: 100),
)
```

#### SafeArea - Avoid System UI Overlaps
```dart
Scaffold(
  body: SafeArea(
    // Avoids notch, status bar, navigation bar
    child: Column(
      children: [
        Text('Safe from system UI!'),
      ],
    ),
  ),
)
```

#### SingleChildScrollView - Enable Scrolling
```dart
SingleChildScrollView(
  padding: EdgeInsets.all(16),
  child: Column(
    children: [
      // Long content that may overflow screen
      Text('Item 1'),
      Text('Item 2'),
      // ... many more items
      Text('Item 100'),
    ],
  ),
)
```

---

### Material Design Widgets

#### Scaffold - Basic App Structure
```dart
Scaffold(
  appBar: AppBar(title: Text('My App')),
  body: Center(child: Text('Hello World')),
  floatingActionButton: FloatingActionButton(
    onPressed: () {},
    child: Icon(Icons.add),
  ),
  bottomNavigationBar: BottomNavigationBar(
    items: [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
    ],
  ),
  drawer: Drawer(child: ListView(...)),
)
```

#### AppBar - Top Navigation Bar
```dart
AppBar(
  title: Text('Page Title'),
  backgroundColor: Colors.blue,
  foregroundColor: Colors.white,
  elevation: 4,
  leading: IconButton(
    icon: Icon(Icons.menu),
    onPressed: () {},
  ),
  actions: [
    IconButton(icon: Icon(Icons.search), onPressed: () {}),
    IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
  ],
)
```

#### FloatingActionButton - Circular Action Button
```dart
FloatingActionButton(
  onPressed: () {
    // Action here
  },
  tooltip: 'Add Item',
  backgroundColor: Colors.blue,
  child: Icon(Icons.add),
)

// Extended FAB with label
FloatingActionButton.extended(
  onPressed: () {},
  icon: Icon(Icons.add),
  label: Text('Add Task'),
)
```

#### Buttons - Interactive Buttons
```dart
// Elevated Button (primary action)
ElevatedButton(
  onPressed: () {},
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.blue,
    foregroundColor: Colors.white,
    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
  ),
  child: Text('Submit'),
)

// Outlined Button (secondary action)
OutlinedButton(
  onPressed: () {},
  style: OutlinedButton.styleFrom(
    side: BorderSide(color: Colors.blue),
  ),
  child: Text('Cancel'),
)

// Text Button (tertiary action)
TextButton(
  onPressed: () {},
  child: Text('Learn More'),
)

// Icon Button
IconButton(
  icon: Icon(Icons.favorite),
  color: Colors.red,
  onPressed: () {},
)
```

#### ListTile - Standard List Item Layout
```dart
ListTile(
  leading: CircleAvatar(child: Text('A')),
  title: Text('List Item Title'),
  subtitle: Text('Secondary text'),
  trailing: Icon(Icons.arrow_forward_ios),
  onTap: () {
    // Handle tap
  },
)

// With checkbox
CheckboxListTile(
  title: Text('Enable notifications'),
  value: true,
  onChanged: (bool? value) {},
)

// With switch
SwitchListTile(
  title: Text('Dark Mode'),
  value: false,
  onChanged: (bool value) {},
)
```

#### Card - Material Card Container
```dart
Card(
  elevation: 4,
  margin: EdgeInsets.all(8),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(12),
  ),
  child: Padding(
    padding: EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Card Title', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        Text('Card content goes here...'),
      ],
    ),
  ),
)
```

#### Chip - Compact Element with Label
```dart
// Basic Chip
Chip(
  label: Text('Flutter'),
  avatar: CircleAvatar(child: Text('F')),
  deleteIcon: Icon(Icons.close),
  onDeleted: () {},
)

// Action Chip
ActionChip(
  label: Text('Action'),
  onPressed: () {},
)

// Filter Chip
FilterChip(
  label: Text('Filter'),
  selected: true,
  onSelected: (bool selected) {},
)

// Choice Chip
ChoiceChip(
  label: Text('Choice'),
  selected: true,
  onSelected: (bool selected) {},
)
```

#### Icon - Material Icons
```dart
// Basic Icon
Icon(Icons.home)

// Styled Icon
Icon(
  Icons.favorite,
  color: Colors.red,
  size: 32,
)

// With semantic label for accessibility
Icon(
  Icons.settings,
  semanticLabel: 'Settings',
)

// Common icons used in course:
// Icons.add, Icons.delete, Icons.edit, Icons.search
// Icons.check, Icons.close, Icons.arrow_forward_ios
// Icons.star, Icons.person, Icons.email
```

### Lists & Dynamic Content
```dart
ListView.builder(
  itemCount: items.length,
  itemBuilder: (context, index) => ItemWidget(item: items[index]),
)
```
- `ListView` - Scrollable list of widgets
- `ListView.builder` - Efficient lazy-loaded lists
- `shrinkWrap: true` - Wrap content size in nested lists
- `NeverScrollableScrollPhysics()` - Disable nested scroll

---

## 🧭 Navigation

### Basic Navigation
```dart
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => DetailScreen(data: item)),
);
```

### Navigation Patterns Used
- `Navigator.push()` - Navigate to new screen
- `Navigator.pop()` - Return to previous screen
- `MaterialPageRoute` - Platform-adaptive page transitions
- Passing data between screens via constructor

---

## 📝 Forms & Input

### Text Input Components
```dart
TextFormField(
  controller: myController,
  validator: (value) => value!.isEmpty ? 'Required field' : null,
  decoration: InputDecoration(
    labelText: 'Username',
    border: OutlineInputBorder(),
    prefixIcon: Icon(Icons.person),
  ),
)
```

### Form Techniques
- `TextEditingController` - Access and control text input
- `GlobalKey<FormState>` - Form validation state
- `Form` widget with `validator` functions
- `InputDecoration` - Styling text fields
- Proper controller disposal in `dispose()`

---

## 🌐 Networking & Async

### HTTP Requests
```dart
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Post>> fetchPosts() async {
  final response = await http.get(Uri.parse('https://api.example.com/posts'));
  if (response.statusCode == 200) {
    return (jsonDecode(response.body) as List)
        .map((json) => Post.fromJson(json))
        .toList();
  }
  throw Exception('Failed to load');
}
```

### Async UI with FutureBuilder
```dart
FutureBuilder<List<Post>>(
  future: _postsFuture,
  builder: (context, snapshot) {
    if (snapshot.hasData) return PostsList(posts: snapshot.data!);
    if (snapshot.hasError) return Text('Error: ${snapshot.error}');
    return CircularProgressIndicator();
  },
)
```

### Key Async Concepts
- `Future<T>` - Async operations returning data
- `async/await` - Clean async syntax
- `FutureBuilder` - Reactive UI for async data
- `snapshot.hasData`, `snapshot.hasError`, `snapshot.data`
- Error handling with try-catch

---

## 🎭 Theming & Styling

### ThemeData Customization
```dart
ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.blue,
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  appBarTheme: AppBarTheme(backgroundColor: Colors.black),
  chipTheme: ChipThemeData(...),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(...),
)
```

### Decoration & Styling
```dart
BoxDecoration(
  color: Colors.blue,
  borderRadius: BorderRadius.circular(15),
  gradient: LinearGradient(
    colors: [Colors.blue.shade400, Colors.purple.shade400],
  ),
)
```

### Styling Techniques
- `BoxDecoration` - Background, borders, shadows
- `LinearGradient` - Gradient backgrounds
- `BorderRadius` - Rounded corners
- `Colors.blue.shade400` - Color shades
- `withOpacity()` - Transparent colors

---

## 📑 Tabs & Advanced Navigation

### TabController Usage
```dart
class _MyState extends State<MyWidget> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(controller: _tabController, tabs: [...]),
      ),
      body: TabBarView(controller: _tabController, children: [...]),
    );
  }
}
```

### Tab Concepts
- `SingleTickerProviderStateMixin` - Animation ticker
- `TabController` - Sync tabs and content
- `TabBar` - Tab header buttons
- `TabBarView` - Tab content pages

---

## 📦 Data Models

### Model Class Pattern
```dart
class Post {
  final int id;
  final String title;
  final String body;

  Post({required this.id, required this.title, required this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}
```

### Model Techniques
- Immutable fields with `final`
- Named parameters with `required`
- `factory` constructor for JSON parsing
- Static helper methods (e.g., `generateMockData()`)

---

## 🗂️ Project Structure

### Recommended Folder Organization
```
lib/
├── main.dart
├── models/
│   └── post.dart
├── screens/ (or pages/)
│   ├── home_screen.dart
│   └── detail_screen.dart
├── widgets/
│   └── post_card.dart
└── services/
    └── api_service.dart
```

### Architecture Patterns
- Separation of concerns (screens, widgets, models, services)
- Reusable widget components
- Service classes for API calls
- Clean imports with relative paths

---

## 💬 Dialogs & Feedback

### AlertDialog
```dart
showDialog(
  context: context,
  builder: (context) => AlertDialog(
    title: Text('Success'),
    content: Text('Your message here'),
    actions: [
      TextButton(
        onPressed: () => Navigator.pop(context),
        child: Text('OK'),
      ),
    ],
  ),
);
```

---

## 🔧 Utility Techniques

### Debug & Development
- `debugPrint()` - Console logging
- `Image.asset()` - Load local images
- `const` constructors - Performance optimization

### List Manipulation
```dart
// Filter lists
_todos.where((t) => !t.isCompleted).toList();

// Find item
_todos.firstWhere((t) => t.id == id);

// Remove item
_todos.removeWhere((t) => t.id == id);

// Reorder items
final item = _todos.removeAt(index);
_todos.insert(newIndex, item);
```

---

## 📊 Summary by Project

| Folder | Project | Key Techniques |
|--------|---------|----------------|
| `DAY3/flutter_application_1` | Counter App | StatefulWidget, setState, Image.asset |
| `DAY3/flutter_application_2` | Shop & Todo | ListView.builder, Navigator, Models |
| `DAY3/app-rep` | YouTube Music Clone | ThemeData, BottomNavigation, SliverAppBar |
| `DAY4/flutter_application_1` | Form Validation | TextFormField, Form, AlertDialog |
| `DAY6/flutter_application_1` | Fetch Data | HTTP GET, FutureBuilder, JSON parsing |
| `DAY6/flutter_application_2` | Posts API | Service classes, Async patterns |
| `todo_pretest` | Todo App (7 versions) | Tabs, Search, Priority, Validation |

---

*Generated from Mobile Device Programming course materials*
