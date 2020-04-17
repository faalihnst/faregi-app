import 'package:flutter/material.dart';
import 'package:faregi_app/core/locator.dart';
import 'package:faregi_app/core/view_model/hotel_viewmodel.dart';
import 'package:faregi_app/scr/models/hotels.dart';
import 'package:faregi_app/scr/widgets/hotel_catalog.dart';

class HotelList extends StatefulWidget {
  @override
  _HotelListState createState() => _HotelListState();
}

class _HotelListState extends State<HotelList> {
  HotelModel _hotelModel = locator<HotelModel>();
  List<Hotel> get hotels => _hotelModel.hotels;
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
                        children: List.generate(hotels.length, (index) {
                          return CatalogHotel(
                            hotel: hotels[index],
                            prices: hotels[index].price,
                            rating: hotels[index].rating,
                            picture: hotels[index].image,
                            name: hotels[index].hotel,
                            description: hotels[index].description,
                            position: hotels[index].location,
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
