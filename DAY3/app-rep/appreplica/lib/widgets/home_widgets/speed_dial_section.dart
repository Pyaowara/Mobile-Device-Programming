import 'package:flutter/material.dart';
import '../../models/music_item.dart';
import '../../screens/player_page.dart';

class SpeedDialSection extends StatelessWidget {
  SpeedDialSection({super.key});

  final List<MusicItem> _speedDialItems = [
    MusicItem('水星 / tofubeats...', 'assets/image1.jpeg', 'tofubeats'),
    MusicItem('1-800', 'assets/image2.jpeg', 'BBno\$'),
    MusicItem('It Was A Good Day', 'assets/image3.jpg', 'Ice Cube'),
    MusicItem('花に風 - バルー...', 'assets/image4.jpeg', 'バルーン'),
    MusicItem('Moonlight', 'assets/image5.jpeg', 'Kali Uchis'),
    MusicItem('アイディスマイル...', 'assets/image6.jpeg', 'Aimer'),
    MusicItem('【Cover】ド屑 /...', 'assets/image7.jpeg', 'Cover Artist'),
    MusicItem('Recap 2025', 'assets/image8.jpeg', 'Youtube'),
    MusicItem('', 'assets/image9.jpg', 'Youtube Music'),
  ];

  @override
  Widget build(BuildContext context) {
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
          const Text(
            'PAT TY',
            style: TextStyle(
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Text(
            'Speed dial',
            style: TextStyle(
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
                return Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    PlayerPage(item: item),
                            transitionsBuilder:
                                (
                                  context,
                                  animation,
                                  secondaryAnimation,
                                  child,
                                ) {
                                  const begin = Offset(0.0, 1.0);
                                  const end = Offset.zero;
                                  const curve = Curves.ease;

                                  var tween = Tween(
                                    begin: begin,
                                    end: end,
                                  ).chain(CurveTween(curve: curve));

                                  return SlideTransition(
                                    position: animation.drive(tween),
                                    child: child,
                                  );
                                },
                            transitionDuration: const Duration(
                              milliseconds: 300,
                            ),
                          ),
                        );
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image.asset(
                          item.imagePath,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
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
                            shadows: [
                              Shadow(blurRadius: 3.0, color: Colors.black),
                            ],
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
