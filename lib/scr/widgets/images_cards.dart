import 'package:flutter/material.dart';
import 'package:faregi_app/scr/models/trip.dart';

import 'image_card.dart';

class ImageCards extends StatefulWidget {
  @override
  _ImageCardsState createState() => _ImageCardsState();
}

class _ImageCardsState extends State<ImageCards> {
  List<Trip> places = [
    Trip(place: 'Austia', image: '1.jpg', duration: '3 Days 2 Nights'),
    Trip(place: 'India', image: '2.jpg', duration: '3 Days 2 Nights'),
    Trip(place: 'Bali', image: '3.jpg', duration: '3 Days 2 Nights'),
    Trip(place: 'Austia', image: '1.jpg', duration: '3 Days 2 Nights'),
    Trip(place: 'India', image: '2.jpg', duration: '3 Days 2 Nights'),
    Trip(place: 'Bali', image: '3.jpg', duration: '3 Days 2 Nights'),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: places.length,
            shrinkWrap: true,
            itemBuilder: (_, index) {
              return ImageCard(
                place: places[index],
                name: places[index].place,
                duration: places[index].duration,
                picture: places[index].image,
              );
            }));
  }
}
