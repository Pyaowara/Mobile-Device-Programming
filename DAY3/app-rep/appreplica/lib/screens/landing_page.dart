import 'package:flutter/material.dart';
import 'home_page.dart';
import '../widgets/landing_widgets/header_section.dart';
import '../widgets/landing_widgets/username_field.dart';
import '../widgets/landing_widgets/genre_dropdown.dart';
import '../widgets/landing_widgets/submit_button.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  String? _selectedGenre;

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomePage(
            username: _usernameController.text,
            selectedGenre: _selectedGenre,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const HeaderSection(),
                const SizedBox(height: 48),
                UsernameField(controller: _usernameController),
                const SizedBox(height: 24),
                GenreDropdown(
                  selectedGenre: _selectedGenre,
                  onChanged: (value) {
                    setState(() {
                      _selectedGenre = value;
                    });
                  },
                ),
                const SizedBox(height: 32),
                SubmitButton(onPressed: _submitForm),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
