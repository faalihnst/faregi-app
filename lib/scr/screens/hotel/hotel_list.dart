import 'package:flutter/material.dart';
import 'package:faregi_app/core/locators.dart';
import 'package:faregi_app/core/view_model/hotel_viewmodel.dart';
import 'package:faregi_app/scr/models/hotels.dart';
import 'package:faregi_app/scr/widgets/hotel_catalog.dart';

class HotelList extends StatefulWidget {
  final List<Hotel> hotels;
  HotelList({this.hotels});
  @override
  _HotelListState createState() => _HotelListState();
}

class _HotelListState extends State<HotelList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.orange[50],
        appBar: AppBar(
          backgroundColor: Colors.red[600],
          centerTitle: true,
          title: Text(
            'fare.gi',
            style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontFamily: 'Libre Baskerville'),
          ),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      child: GridView.count(
                        scrollDirection: Axis.vertical,
                        primary: true,
                        padding: const EdgeInsets.all(10.0),
                        crossAxisCount: 1,
                        shrinkWrap: true,
                        childAspectRatio: 2.0,
                        children: List.generate(widget.hotels.length, (index) {
                          return CatalogHotel(
                            hotel: widget.hotels[index],
                            prices: widget.hotels[index].price,
                            rating: widget.hotels[index].rating,
                            picture: widget.hotels[index].image,
                            name: widget.hotels[index].hotel,
                            description: widget.hotels[index].description,
                            position: widget.hotels[index].location,
                          );
                        }),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
