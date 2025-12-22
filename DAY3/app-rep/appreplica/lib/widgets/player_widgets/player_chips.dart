import 'package:flutter/material.dart';

class InteractionChips extends StatelessWidget {
  const InteractionChips({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> chipsData = [
      {'icon': Icons.thumb_up, 'label': '8.4k'},
      {'icon': Icons.thumb_down_alt_outlined, 'label': ''},
      {'icon': Icons.comment_outlined, 'label': '151'},
      {'icon': Icons.forum_outlined, 'label': 'Live chat replay'},
      {'icon': Icons.format_list_bulleted_add, 'label': 'Save'},
      {'icon': Icons.shortcut, 'label': 'Save'},
    ];

    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 16.0, bottom: 8.0),
      child: SizedBox(
        height: 40,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final chip = chipsData[index];
            return _buildPillChip(chip['icon'], chip['label']);
          },
          separatorBuilder: (_, __) => const SizedBox(width: 8),
          itemCount: chipsData.length,
        ),
      ),
    );
  }

  Widget _buildPillChip(IconData icon, String label) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white, size: 20),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(color: Colors.white),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
