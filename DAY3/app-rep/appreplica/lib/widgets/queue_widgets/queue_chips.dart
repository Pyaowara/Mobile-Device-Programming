import 'package:flutter/material.dart';

class QueueFilterChips extends StatelessWidget {
  const QueueFilterChips({super.key, required this.mainColor});
  final Color mainColor;

  @override
  Widget build(BuildContext context) {
    final filters = [
      "All",
      "Familiar",
      "Discover",
      "Popular",
      "Deep cuts",
      "Party",
    ];
    return Container(
      padding: const EdgeInsets.only(top: 8, left: 10, bottom: 12),
      color: HSLColor.fromColor(mainColor).withLightness(0.15).toColor(),
      height: 50,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: filters.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) => Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: index == 0 ? Colors.white : Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          alignment: Alignment.center,
          child: Text(
            filters[index],
            style: TextStyle(
              color: index == 0 ? Colors.black : Colors.white,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}
