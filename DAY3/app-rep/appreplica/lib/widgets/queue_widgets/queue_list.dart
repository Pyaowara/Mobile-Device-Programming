import 'package:flutter/material.dart';
import '../../models/music_item.dart';

class QueueTile extends StatelessWidget {
  final MusicItem activeItem;
  final List<MusicItem> queue;
  final Color mainColor;

  const QueueTile({
    super.key,
    required this.activeItem,
    required this.queue,
    required this.mainColor,
  });
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        final item = queue[index];
        final bool isCurrent = item.title == activeItem.title;

        return Container(
          color: isCurrent
              ? HSLColor.fromColor(mainColor).withLightness(0.25).toColor()
              : HSLColor.fromColor(mainColor).withLightness(0.15).toColor(),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.asset(
                item.imagePath,
                width: 68,
                height: 68,
                fit: BoxFit.cover,
              ),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  item.artist,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            trailing: const Icon(Icons.drag_handle, color: Colors.white54),
          ),
        );
      }, childCount: queue.length),
    );
  }
}
