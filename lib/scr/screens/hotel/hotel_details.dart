import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:faregi_app/scr/models/hotels.dart';

class HotelDetails extends StatelessWidget {
  final Hotel hotel;
  HotelDetails({this.hotel});
  final controller = PageController(
    initialPage: 1,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 300,
                child: PageView(
                  controller: controller,
                  children: <Widget>[
                    ClipRect(
                      child: Image.asset(
                        '${hotel.image}',
                        height: 400,
                        width: double.infinity,
                        fit: BoxFit.fill,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0, left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      hotel.hotel,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.red[400],
                      ),
                    ),
                    SmoothStarRating(
                      color: Colors.yellow,
                      allowHalfRating: true,
                      starCount: 5,
                      rating: hotel.rating.toDouble(),
                      borderColor: Colors.red,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.location_on,
                          color: Colors.red[400],
                        ),
                        Text(
                          hotel.location,
                          style: TextStyle(color: Colors.red[400]),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 16.0, left: 16, right: 16, bottom: 0),
                  child: RichText(
                    text: TextSpan(
                        children: [
                          TextSpan(
                              text: 'Overview\n',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.black)),
                          TextSpan(text: hotel.description)
                        ],
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 0),
                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Amenities',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 2),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 10.0, bottom: 10, top: 10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(7.0),
                            child: Container(
                              padding: EdgeInsets.all(6),
                              color: Colors.redAccent[400],
                              child: Icon(Icons.wifi),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 10.0, bottom: 10, top: 10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(7),
                            child: Container(
                              padding: EdgeInsets.all(6),
                              color: Colors.redAccent[400],
                              child: Icon(Icons.directions_car),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 10.0, bottom: 10, top: 10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(7),
                            child: Container(
                              padding: EdgeInsets.all(6),
                              color: Colors.redAccent[400],
                              child: Icon(Icons.local_hotel),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    color: Colors.red[600],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: 'Price\n',
                                style: TextStyle(fontSize: 18)),
                            TextSpan(
                                text: '${hotel.price}/Night',
                                style: TextStyle(
                                    fontSize: 26, fontWeight: FontWeight.bold))
                          ]),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Book Room',
                              style:
                                  TextStyle(color: Colors.pink, fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Positioned(
            top: 20,
            left: 10,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Align(
                alignment: Alignment.topLeft,
                child: Icon(Icons.arrow_back_ios),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ImageList extends StatelessWidget {
  final String image;
  const ImageList({this.image});

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: Image.asset(
        image,
        height: 400,
        width: double.infinity,
        fit: BoxFit.fill,
      ),
    );
  }
}
