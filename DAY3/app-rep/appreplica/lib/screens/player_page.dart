import 'dart:ui'; //ของ Image Filter

import 'package:flutter/material.dart';
import '../models/music_item.dart';
import '../widgets/player_widgets/player_app_bar.dart';
import '../widgets/player_widgets/song_display.dart';
import '../widgets/player_widgets/player_chips.dart';
import '../widgets/player_widgets/music_control.dart';
import '../widgets/player_widgets/bottom_player_bar.dart';

class PlayerPage extends StatelessWidget {
  const PlayerPage({super.key, required this.item});

  final MusicItem item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.74),
                BlendMode.darken,
              ),
              child: Image.asset(item.imagePath, fit: BoxFit.cover),
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 80, sigmaY: 80),
              child: Container(
                color: Colors.black.withOpacity(0),
              ),
            ),
          ),
          CustomScrollView(
            slivers: [
              PlayerAppBar(item: item),
              SliverToBoxAdapter(child: SongDisplay(item: item)),
              SliverToBoxAdapter(child: const InteractionChips()),
              SliverToBoxAdapter(child: const MusicControls()),
            ],
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(child: PlayerBottomNav(item: item)),
    );
  }
}
