import 'package:flutter/material.dart';
import 'package:faregi_app/scr/models/cars.dart';

class CarDetails extends StatelessWidget {
  final Car cars;
  CarDetails({this.cars});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.redAccent[400],
        title: Text('fare.gi'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 300,
            child: Image.asset(cars.image),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(cars.car,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        )),
                    Text(
                      cars.carType,
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Icon(
                      Icons.airline_seat_legroom_normal,
                      size: 40,
                    ),
                    Text('${cars.seat} Seats', style: TextStyle(fontSize: 15)),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Specifications',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.battery_charging_full,
                      size: 40,
                    ),
                    Text('Petrol')
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.drive_eta,
                      size: 40,
                    ),
                    Text(cars.driver == true ? 'With Driver' : 'Without Driver')
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.phone_android,
                      size: 40,
                    ),
                    Text('Android Support')
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.lock_outline,
                      size: 40,
                    ),
                    Text('High Security')
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 60,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Rp. ${cars.price}/Day',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    )),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                    color: Colors.red[400],
                    child: Text(
                      'Book',
                      style: TextStyle(fontSize: 20),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
