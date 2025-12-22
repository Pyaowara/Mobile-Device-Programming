import 'package:flutter/material.dart';

class TabHeader extends StatelessWidget {
  const TabHeader({super.key, required this.mainColor});

  final Color mainColor;

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _TabHeaderDelegate(mainColor: mainColor),
    );
  }

  static Widget _buildTab(String text, bool isActive) {
    return Center(
      child: Text(
        text,
        style: TextStyle(
          color: isActive ? Colors.white : Colors.white60,
          fontWeight: FontWeight.bold,
          fontSize: 14,
          letterSpacing: 0.8,
        ),
      ),
    );
  }
}

class _TabHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Color mainColor;

  _TabHeaderDelegate({required this.mainColor});

  @override
  double get minExtent => 56.0;

  @override
  double get maxExtent => 56.0;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      padding: const EdgeInsets.only(top: 12.0),
      decoration: BoxDecoration(
        color: HSLColor.fromColor(mainColor).withLightness(0.15).toColor(),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TabHeader._buildTab("UP NEXT", true),
              TabHeader._buildTab("LYRICS", false),
              TabHeader._buildTab("RELATED", false),
            ],
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              height: 2,
              width: MediaQuery.of(context).size.width / 2.6,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(_TabHeaderDelegate oldDelegate) {
    return oldDelegate.mainColor != mainColor;
  }
}
