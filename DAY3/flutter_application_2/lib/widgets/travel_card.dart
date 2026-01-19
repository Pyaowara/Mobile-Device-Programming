import 'package:flutter/material.dart';
import '../models/travel_spot.dart';

class TravelCard extends StatelessWidget {
  const TravelCard({super.key, required this.spot});

  final TravelSpot spot;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Image.network(
            spot.imageUrl,
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          ListTile(
            title: Text(
              spot.name,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(spot.location, style: TextStyle(fontSize: 16)),
            trailing: Icon(Icons.arrow_forward),
          ),
        ],
      ),
    );
  }
}
