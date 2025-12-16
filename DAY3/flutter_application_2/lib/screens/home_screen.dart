import 'package:flutter/material.dart';
import '../models/travel_spot.dart';
import '../widgets/travel_card.dart';

class HomeScreen extends StatelessWidget {
  final List<TravelSpot> spots = [
    TravelSpot(
      name: 'Bangkok',
      location: 'Thailand',
      imageUrl: 'https://internationalliving.com/_next/image/?url=https%3A%2F%2Fimages.ctfassets.net%2Fwv75stsetqy3%2FDaKdXY2tkQGWeVQiCbSx7%2Fac01166282697e4e0cafb99180d35cd1%2FThailand_Featured.jpg%3Fq%3D60%26fit%3Dfill%26fm%3Dwebp&w=3840&q=60',
    ),
    TravelSpot(
      name: 'Chiangmai',
      location: 'Thailand',
      imageUrl: 'https://images.contentstack.io/v3/assets/blt06f605a34f1194ff/blt31f457d176f377f9/683d9b05b705e0398e63fe73/pexels-gije-16986826-MOBILE_HEADER.jpg?fit=crop&disable=upscale&auto=webp&quality=60&crop=smart',
    ),
    TravelSpot(
      name: 'Bangsaen',
      location: 'Thailand',
      imageUrl: 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/16/ee/a9/df/caption.jpg?w=1000&h=1000&s=1',
    ),
  ];
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thailand Travel Spots'),
      ),
      body: ListView.builder(
        itemCount: spots.length,
        itemBuilder: (context, index) {
          return TravelCard(spot: spots[index]);
        },
      ),
    );
  }
}