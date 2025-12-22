import 'package:flutter/material.dart';

class MusicControls extends StatelessWidget {
  const MusicControls({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Padding(padding: const EdgeInsets.only(top: 16)),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  trackHeight: 2,
                  thumbShape: const RoundSliderThumbShape(
                    enabledThumbRadius: 6,
                  ),
                  overlayShape: const RoundSliderOverlayShape(
                    overlayRadius: 12,
                  ),
                  activeTrackColor: Colors.white,
                  inactiveTrackColor: Colors.white24,
                  thumbColor: Colors.white,
                ),
                child: Slider(value: 0.06, max: 3.06, onChanged: (value) {}),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '0:06',
                      style: TextStyle(color: Colors.white70, fontSize: 12),
                    ),
                    Text(
                      '3:06',
                      style: TextStyle(color: Colors.white70, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: const Icon(Icons.shuffle, color: Colors.white, size: 28),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                Icons.skip_previous,
                color: Colors.white,
                size: 42,
              ),
              onPressed: () {},
            ),
            Container(
              height: 75,
              width: 75,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.play_arrow_rounded,
                color: Colors.black,
                size: 50,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.skip_next, color: Colors.white, size: 42),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.repeat, color: Colors.white, size: 28),
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}
