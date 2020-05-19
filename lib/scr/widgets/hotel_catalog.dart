import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:faregi_app/scr/models/hotels.dart';
import 'package:faregi_app/scr/screens/hotel/hotel_details.dart';

class CatalogHotel extends StatelessWidget {
  final String name;
  final Hotel hotel;
  final int rating;
  final String picture;
  final String description;
  final String prices;
  final String position;

  CatalogHotel(
      {this.hotel,
      @required this.rating,
      @required this.picture,
      @required this.prices,
      @required this.name,
      @required this.description,
      @required this.position});
  @override
  Widget build(BuildContext context) {
    return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5,
      margin: EdgeInsets.all(5),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => HotelDetails(
                hotel: hotel,
              ),
            ),
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Image.network(
                    '$picture',
                    height: 150.0,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      ' $name',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.red[400],
                      ),
                    ),
                    SmoothStarRating(
                      color: Colors.yellow,
                      allowHalfRating: true,
                      starCount: 5,
                      rating: rating.toDouble(),
                      borderColor: Colors.red,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.location_on,
                          color: Colors.red[400],
                        ),
                        Text(
                          '$position',
                          style: TextStyle(color: Colors.red[400]),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 62.0,
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          ' $prices',
                          style:
                              TextStyle(color: Colors.red[400], fontSize: 22.0),
                        ),
                        Text(
                          '/room/night',
                          style:
                              TextStyle(color: Colors.red[400], fontSize: 16.0),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
