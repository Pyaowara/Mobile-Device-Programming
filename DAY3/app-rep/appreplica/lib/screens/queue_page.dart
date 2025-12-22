import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import '../models/music_item.dart';
import '../widgets/queue_widgets/top_player.dart';
import '../widgets/queue_widgets/tab_header.dart';
import '../widgets/queue_widgets/queue_count.dart';
import '../widgets/queue_widgets/queue_chips.dart';
import '../widgets/queue_widgets/queue_list.dart';

class QueuePage extends StatelessWidget {
  QueuePage({super.key, required this.item});

  final MusicItem item;
  final List<MusicItem> queueItems = [
    MusicItem('水星 / tofubeats...', 'assets/image1.jpeg', 'tofubeats'),
    MusicItem('1-800', 'assets/image2.jpeg', 'BBno\$'),
    MusicItem('It Was A Good Day', 'assets/image3.jpg', 'Ice Cube'),
    MusicItem('花に風 - バルー...', 'assets/image4.jpeg', 'バルーン'),
    MusicItem('Moonlight', 'assets/image5.jpeg', 'Kali Uchis'),
    MusicItem('アイディスマイル...', 'assets/image6.jpeg', 'Aimer'),
    MusicItem('【Cover】ド屑 /...', 'assets/image7.jpeg', 'Cover Artist'),
    MusicItem('Recap 2025', 'assets/image8.jpeg', 'Youtube'),
    MusicItem('IRIS OUT', 'assets/image10.png', 'Kenshi Yonezu'),
    MusicItem('[MV] IDOL - HAKOS BAELZ COVER', 'assets/image11.jpg', 'YOASOBI'),
    MusicItem('Recommended', 'assets/image9.jpg', 'Youtube Music'),
  ];

  Future<Color> _getMainColor() async {
    final PaletteGenerator generator = await PaletteGenerator.fromImageProvider(
      AssetImage(item.imagePath),
      maximumColorCount: 1,
    );
    return generator.dominantColor?.color ?? Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Color>(
      future: _getMainColor(),
      builder: (context, snapshot) {
        final Color mainColor = snapshot.data ?? Colors.black;

        return Scaffold(
          body: Stack(
            children: [
              Container(color: mainColor),
              Container(color: Colors.black.withOpacity(0.8)),
              CustomScrollView(
                slivers: [
                  TopPlayer(item: item, mainColor: mainColor),
                  TabHeader(mainColor: mainColor),
                  SliverToBoxAdapter(
                    child: QueueCount(item: item, mainColor: mainColor),
                  ),
                  SliverToBoxAdapter(
                    child: QueueFilterChips(mainColor: mainColor),
                  ),
                  QueueTile(
                    activeItem: item,
                    queue: queueItems,
                    mainColor: mainColor,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
