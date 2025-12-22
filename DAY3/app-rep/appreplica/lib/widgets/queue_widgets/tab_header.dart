import 'package:flutter/material.dart';

class TabHeader extends StatelessWidget {
  const TabHeader({super.key, required this.mainColor});

  final Color mainColor;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      toolbarHeight: 2,
      backgroundColor: HSLColor.fromColor(
        mainColor,
      ).withLightness(0.15).toColor(),
      surfaceTintColor: Colors.transparent,
      scrolledUnderElevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      flexibleSpace: Container(
        padding: const EdgeInsets.only(top: 20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildTab("UP NEXT", true),
                _buildTab("LYRICS", false),
                _buildTab("RELATED", false),
              ],
            ),
            const SizedBox(height: 11),
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
      ),
    );
  }

  Widget _buildTab(String text, bool isActive) {
    return Center(
      child: Text(
        text,
        style: TextStyle(
          color: isActive ? Colors.white : Colors.white60,
          fontWeight: FontWeight.bold,
          fontSize: 16,
          letterSpacing: 0.8,
        ),
      ),
    );
  }
}
