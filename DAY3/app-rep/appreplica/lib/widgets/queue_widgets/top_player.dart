import 'package:flutter/material.dart';
import '../../models/music_item.dart';
import '../../screens/player_page.dart';
import 'dart:ui';

class TopPlayer extends StatelessWidget {
  const TopPlayer({super.key, required this.item, required this.mainColor});

  final MusicItem item;
  final Color mainColor;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      toolbarHeight: 70,
      backgroundColor: HSLColor.fromColor(
        mainColor,
      ).withLightness(0.07).toColor(),
      surfaceTintColor: Colors.transparent,
      scrolledUnderElevation: 0,
      titleSpacing: 12,
      title: GestureDetector(
        onTap: () {
          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  PlayerPage(item: item),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                    return FadeTransition(
                      opacity: animation,
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 10.0 * animation.value,
                          sigmaY: 10.0 * animation.value,
                        ),
                        child: child,
                      ),
                    );
                  },
            ),
          );
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image.asset(
                    item.imagePath,
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        item.artist,
                        style: const TextStyle(
                          color: Colors.white60,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.cast, color: Colors.white, size: 24),
                const SizedBox(width: 20),
                const Icon(Icons.pause, color: Colors.white, size: 28),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
