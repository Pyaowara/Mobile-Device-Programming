import 'package:flutter/material.dart';
import '../../screens/queue_page.dart';
import '../../models/music_item.dart';

class PlayerBottomNav extends StatelessWidget {
  const PlayerBottomNav({super.key, required this.item});

  final MusicItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => QueuePage(item: item)),
              );
            },
            child: const Text(
              'UP NEXT',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const Text(
            'LYRICS',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Text(
            'RELATED',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
