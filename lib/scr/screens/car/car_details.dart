import 'package:flushbar/flushbar.dart';
import 'package:flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:faregi_app/scr/models/cars.dart';

class CarDetails extends StatefulWidget {
  final Car cars;
  CarDetails({this.cars});

  @override
  _CarDetailsState createState() => _CarDetailsState();
}

class _CarDetailsState extends State<CarDetails> {
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
            child: Image.network(widget.cars.image),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(widget.cars.car,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        )),
                    Text(
                      widget.cars.carType,
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
                    Text('${widget.cars.seat} Seats',
                        style: TextStyle(fontSize: 15)),
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
                    Text(widget.cars.driver == true
                        ? 'With Driver'
                        : 'Without Driver')
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
                Text('${widget.cars.price}/Day',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    )),
                GestureDetector(
                  onTap: () {
                    Flushbar(
                      flushbarStyle: FlushbarStyle.FLOATING,
                      animationDuration: Duration(milliseconds: 400),
                      duration: Duration(seconds: 3),
                      margin: EdgeInsets.all(12),
                      padding: EdgeInsets.all(14),
                      borderRadius: 8,
                      icon: Icon(Icons.warning, color: Colors.white),
                      messageText: Text('Fitur Booking Belum Tersedia',
                          style: TextStyle(color: Colors.white)),
                      backgroundColor: Colors.orange,
                    ).show(context);
                  },
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                      color: Colors.red[400],
                      child: Text(
                        'Book',
                        style: TextStyle(fontSize: 20),
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
