import 'package:flutter/material.dart';
import '../models/music_item.dart';
import '../widgets/home_widgets/sliver_app_bar.dart';
import '../widgets/home_widgets/chips.dart';
import '../widgets/home_widgets/speed_dial_section.dart';
import '../widgets/home_widgets/music_videos_section.dart';
import '../widgets/home_widgets/mini_player.dart';
import '../widgets/home_widgets/bottom_navigation_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, this.item});

  final MusicItem? item;

  @override
  Widget build(BuildContext context) {
    final currentItem =
        item ??
        MusicItem(
          'Top songs for you',
          'assets/topsong.jpeg',
          'Youtube Music',
        );

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBarWidget(),
          const SliverToBoxAdapter(child: ChipsWidget()),
          SliverToBoxAdapter(child: SpeedDialSection()),
          SliverToBoxAdapter(child: MusicVideosSection()),
          const SliverToBoxAdapter(child: SizedBox(height: 80)),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MiniPlayer(item: currentItem),
            const BottomNavigationBarWidget(),
          ],
        ),
      ),
    );
  }
}
