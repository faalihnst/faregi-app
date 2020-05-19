import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ticket_widget/flutter_ticket_widget.dart';
import 'package:faregi_app/scr/models/trains.dart';

class TrainDetails extends StatelessWidget {
  TrainDetails({this.trains});
  final Train trains;

  @override
  Widget build(BuildContext context) {
    var newFromTime = trains.fromTime.split(" ");
    var newToTime = trains.toTime.split(" ");
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
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 100.0),
              child: FlutterTicketWidget(
                width: 350.0,
                height: 300.0,
                isCornerRounded: true,
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: 120.0,
                            height: 25.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              border:
                                  Border.all(width: 1.0, color: Colors.green),
                            ),
                            child: Center(
                              child: Text(
                                trains.classType,
                                style: TextStyle(color: Colors.green),
                              ),
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      trains.fromStation,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Icon(
                                        Icons.train,
                                        color: Colors.pink,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        trains.toStation,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Row(
                                children: <Widget>[
                                  Text(
                                    newFromTime[1],
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      'to',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      newToTime[1],
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Text(
                          'Train Ticket',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                        child: Column(
                          children: <Widget>[
                            ticketDetailsWidget(
                                'Flight Code',
                                trains.trainCode.toString(),
                                'Date',
                                '24-12-2020'),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 12.0, right: 20.0),
                              child: ticketDetailsWidget('Airline',
                                  trains.train, 'Price', trains.price),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
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
                height: 50.0,
                width: 150.0,
                child: Center(
                  child: Text(
                    'Book',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Libre Baskerville',
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.redAccent[400],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget ticketDetailsWidget(String firstTitle, String firstDesc,
      String secondTitle, String secondDesc) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                firstTitle,
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  firstDesc,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                secondTitle,
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  secondDesc,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
