import 'package:flutter/material.dart';

class GenreDropdown extends StatelessWidget {
  const GenreDropdown({
    super.key,
    required this.selectedGenre,
    required this.onChanged,
  });

  final String? selectedGenre;
  final ValueChanged<String?> onChanged;

  final List<String> _genres = const [
    'Energise',
    'Relax',
    'Feel good',
    'Commute',
    'Work',
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      initialValue: selectedGenre,
      decoration: InputDecoration(
        labelText: 'Favorite Genre',
        hintText: 'Select your favorite genre',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        filled: true,
        fillColor: Colors.grey.shade900,
        prefixIcon: const Icon(Icons.library_music),
      ),
      items: _genres.map((genre) {
        return DropdownMenuItem<String>(value: genre, child: Text(genre));
      }).toList(),
      onChanged: onChanged,
      validator: (value) {
        if (value == null) {
          return 'Please select a genre';
        }
        return null;
      },
    );
  }
}
