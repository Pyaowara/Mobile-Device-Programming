import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

final List<String> _moodChips = [
  'Energise',
  'Relax',
  'Feel good',
  'Commute',
  'Work',
];

class MusicItem {
  final String title;
  final String imagePath;
  MusicItem(this.title, this.imagePath);
}

class VideoItem {
  final String title;
  final String channel;
  final String imagePath;
  final Color placeholderColor;

  VideoItem(this.title, this.channel, this.imagePath, this.placeholderColor);
}

final List<MusicItem> _speedDialItems = [
  MusicItem('水星 / tofubeats...', 'assets/image1.jpeg'),
  MusicItem('1-800', 'assets/image2.jpeg'),
  MusicItem('It Was A Good Day', 'assets/image3.jpg'),
  MusicItem('花に風 - バルー...', 'assets/image4.jpeg'),
  MusicItem('Moonlight', 'assets/image5.jpeg'),
  MusicItem('アイディスマイル...', 'assets/image6.jpeg'),
  MusicItem('【Cover】ド屑 /...', 'assets/image7.jpeg'),
  MusicItem('Recap 2025', 'assets/image8.jpeg'),
  MusicItem('', 'assets/image9.jpg'),
];

final List<VideoItem> _videoItems = [
  VideoItem(
    'Y Remix (Still Ballin x Family A',
    'VIBE4U2',
    'assets/balling.jpeg',
    Colors.purple.shade900,
  ),
  VideoItem(
    'Top 10 Pop Songs of the Week',
    'Music Charts',
    'assets/topsong.jpeg',
    Colors.red.shade900,
  ),
  VideoItem(
    'Late Night Lo-Fi Beats',
    'Relax Channel',
    'assets/lofi.jpg',
    Colors.blue.shade900,
  ),
];

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YouTube Music Clone',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          elevation: 0,
        ),
        chipTheme: ChipThemeData(
          backgroundColor: Colors.grey.shade800,
          labelStyle: const TextStyle(color: Colors.white, fontSize: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.black,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: TextStyle(fontSize: 10),
          unselectedLabelStyle: TextStyle(fontSize: 10),
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(context),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 8.0, bottom: 8.0),
              child: _buildChips(),
            ),
          ),
          SliverToBoxAdapter(
            child: _buildSpeedDialSection('PAT TY', 'Speed dial'),
          ),
          SliverToBoxAdapter(child: _buildMusicVideosSection()),
          const SliverToBoxAdapter(child: SizedBox(height: 80)),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [const _MiniPlayer(), _buildBottomNavigationBar()],
        ),
      ),
    );
  }

  Widget _buildSliverAppBar(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      backgroundColor: Colors.black,
      title: Row(
        children: [
          const Icon(Icons.music_note, color: Colors.red, size: 28),
          const SizedBox(width: 4),
          Text(
            'Music',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      actions: [
        Stack(
          children: [
            IconButton(
              icon: const Icon(Icons.notifications_none, size: 24),
              onPressed: () {},
            ),
            Positioned(
              right: 8,
              top: 8,
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(6),
                ),
                constraints: const BoxConstraints(minWidth: 14, minHeight: 14),
                child: const Text(
                  '8',
                  style: TextStyle(color: Colors.white, fontSize: 8),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
        IconButton(icon: const Icon(Icons.search, size: 24), onPressed: () {}),
        Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: CircleAvatar(
            backgroundImage: const AssetImage('assets/profile.jpg'),
            radius: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildChips() {
    return SizedBox(
      height: 38,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Chip(
          label: Text(_moodChips[index]),
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 0),
        ),
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemCount: _moodChips.length,
      ),
    );
  }

  Widget _buildSpeedDialSection(String subtitle, String title) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16.0,
        right: 0.0,
        top: 12.0,
        bottom: 20.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 380,
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(right: 16.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 1.0,
              ),
              itemCount: _speedDialItems.length,
              itemBuilder: (context, index) {
                final item = _speedDialItems[index];
                return _buildAlbumArt(item);
              },
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildAlbumArt(MusicItem item) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Image.asset(
            item.imagePath,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text(
              item.title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14,
                shadows: [Shadow(blurRadius: 3.0, color: Colors.black)],
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMusicVideosSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Music videos for you',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Play all',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 195,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: _videoItems.length,
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                final video = _videoItems[index];
                return _buildVideoCard(video);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVideoCard(VideoItem video) {
    return SizedBox(
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(video.imagePath),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Center(
              child: Icon(Icons.play_arrow, color: Colors.white, size: 40),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            video.title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            video.channel,
            style: const TextStyle(color: Colors.grey, fontSize: 12),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(
          icon: Icon(Icons.play_circle_outline),
          label: 'Samples',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
        BottomNavigationBarItem(
          icon: Icon(Icons.library_music),
          label: 'Library',
        ),
      ],
      currentIndex: 0,
      onTap: (index) {},
    );
  }
}

class _MiniPlayer extends StatelessWidget {
  const _MiniPlayer();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade900,
      padding: const EdgeInsets.only(left: 12, right: 0, top: 4, bottom: 4),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('assets/balling.jpg'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Icon(
                  Icons.music_note,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                      'Y Remix (Still Ballin x Family A',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 1),
                    Text(
                      'VIBE4U2',
                      style: TextStyle(color: Colors.grey, fontSize: 11),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.cast, color: Colors.white, size: 24),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                  size: 30,
                ),
                padding: const EdgeInsets.only(left: 8.0, right: 12.0),
                constraints: const BoxConstraints(),
              ),
            ],
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              height: 2.0,
              width: MediaQuery.of(context).size.width * 0.4,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
