// This is the model class that represents a single todo item
// A model is like a blueprint for our data

class TodoModel {
  // Properties - these are the data fields for each todo
  final String id; // Unique ID for each todo
  final String title; // The text/name of the todo
  bool isCompleted; // Whether the todo is done or not

  // Constructor - used to create a new TodoModel
  // Required parameters must be provided when creating a new todo
  TodoModel({
    required this.id,
    required this.title,
    this.isCompleted = false, // Default value is false (not completed)
  });
}
