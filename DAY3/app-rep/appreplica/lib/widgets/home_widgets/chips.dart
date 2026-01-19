import 'package:flutter/material.dart';

class ChipsWidget extends StatelessWidget {
  const ChipsWidget({super.key, this.selectedGenre});

  final String? selectedGenre;

  final List<String> _moodChips = const [
    'Energise',
    'Relax',
    'Feel good',
    'Commute',
    'Work',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 8.0, bottom: 8.0),
      child: SizedBox(
        height: 38,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final isSelected = _moodChips[index] == selectedGenre;
            return Chip(
              label: Text(_moodChips[index]),
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 0),
              backgroundColor: isSelected ? Colors.red : Colors.grey.shade800,
            );
          },
          separatorBuilder: (_, __) => const SizedBox(width: 8),
          itemCount: _moodChips.length,
        ),
      ),
    );
  }
}
