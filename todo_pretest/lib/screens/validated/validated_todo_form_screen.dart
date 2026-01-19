import 'package:flutter/material.dart';
import '../../models/validated_todo_model.dart';
import '../../widgets/validated/validated_todo_form_card.dart';
import '../../widgets/validated/validated_todo_priority_slider.dart';
import '../../widgets/validated/validated_todo_info_box.dart';

class ValidatedTodoFormScreen extends StatefulWidget {
  final ValidatedTodoModel? todo;

  const ValidatedTodoFormScreen({super.key, this.todo});

  @override
  State<ValidatedTodoFormScreen> createState() =>
      _ValidatedTodoFormScreenState();
}

class _ValidatedTodoFormScreenState extends State<ValidatedTodoFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  late TextEditingController _emailController;
  late int _priority;
  late DateTime _dueDate;
  bool _autoValidate = false;

  bool get isEditing => widget.todo != null;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.todo?.title ?? '');
    _descriptionController = TextEditingController(
      text: widget.todo?.description ?? '',
    );
    _emailController = TextEditingController(text: widget.todo?.email ?? '');
    _priority = widget.todo?.priority ?? 3;
    _dueDate =
        widget.todo?.dueDate ?? DateTime.now().add(const Duration(days: 1));
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  String? _validateTitle(String? value) {
    if (value == null || value.trim().isEmpty) return 'Title is required';
    if (value.trim().length < 3) return 'Title must be at least 3 characters';
    if (value.trim().length > 50)
      return 'Title must be less than 50 characters';
    return null;
  }

  String? _validateDescription(String? value) {
    if (value == null || value.trim().isEmpty) return 'Description is required';
    if (value.trim().length < 10)
      return 'Description must be at least 10 characters';
    if (value.trim().length > 200)
      return 'Description must be less than 200 characters';
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.trim().isEmpty)
      return 'Email is required for notifications';
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value.trim()))
      return 'Please enter a valid email address';
    return null;
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _dueDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.amber.shade700,
              onPrimary: Colors.white,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) setState(() => _dueDate = picked);
  }

  void _submit() {
    setState(() => _autoValidate = true);
    if (_formKey.currentState!.validate()) {
      final todo = ValidatedTodoModel(
        id: widget.todo?.id ?? DateTime.now().millisecondsSinceEpoch.toString(),
        title: _titleController.text.trim(),
        description: _descriptionController.text.trim(),
        email: _emailController.text.trim(),
        priority: _priority,
        dueDate: _dueDate,
        isCompleted: widget.todo?.isCompleted ?? false,
      );
      Navigator.pop(context, todo);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade50,
      appBar: AppBar(
        title: Text(isEditing ? 'Edit Task' : 'New Task'),
        backgroundColor: Colors.amber.shade700,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          autovalidateMode: _autoValidate
              ? AutovalidateMode.onUserInteraction
              : AutovalidateMode.disabled,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ValidatedTodoFormCard(
                child: TextFormField(
                  controller: _titleController,
                  decoration: InputDecoration(
                    labelText: 'Title *',
                    hintText: 'Enter task title (3-50 chars)',
                    prefixIcon: Icon(Icons.title, color: Colors.amber.shade700),
                    border: InputBorder.none,
                    counterText: '${_titleController.text.length}/50',
                  ),
                  maxLength: 50,
                  validator: _validateTitle,
                  onChanged: (_) => setState(() {}),
                ),
              ),
              const SizedBox(height: 16),
              ValidatedTodoFormCard(
                child: TextFormField(
                  controller: _descriptionController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    labelText: 'Description *',
                    hintText: 'Describe your task (10-200 chars)',
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(bottom: 40),
                      child: Icon(
                        Icons.description,
                        color: Colors.amber.shade700,
                      ),
                    ),
                    border: InputBorder.none,
                    counterText: '${_descriptionController.text.length}/200',
                  ),
                  maxLength: 200,
                  validator: _validateDescription,
                  onChanged: (_) => setState(() {}),
                ),
              ),
              const SizedBox(height: 16),
              ValidatedTodoFormCard(
                child: TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Notification Email *',
                    hintText: 'your@email.com',
                    prefixIcon: Icon(Icons.email, color: Colors.amber.shade700),
                    border: InputBorder.none,
                  ),
                  validator: _validateEmail,
                ),
              ),
              const SizedBox(height: 16),
              ValidatedTodoFormCard(
                child: ValidatedTodoPrioritySlider(
                  priority: _priority,
                  onChanged: (value) => setState(() => _priority = value),
                ),
              ),
              const SizedBox(height: 16),
              ValidatedTodoFormCard(
                child: ListTile(
                  leading: Icon(
                    Icons.calendar_today,
                    color: Colors.amber.shade700,
                  ),
                  title: const Text('Due Date *'),
                  subtitle: Text(
                    '${_dueDate.day}/${_dueDate.month}/${_dueDate.year}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: _pickDate,
                ),
              ),
              const SizedBox(height: 24),
              const ValidatedTodoInfoBox(),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _submit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber.shade700,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  isEditing ? 'Update Task' : 'Create Task',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
