import 'package:flutter/material.dart';
import 'package:faregi_app/scr/models/trains.dart';
import 'package:faregi_app/scr/screens/train/train_details.dart';
import 'dart:core';

class CatalogTrain extends StatelessWidget {
  final String name;
  final Train train;
  final String trainCode;
  final String fromStation;
  final String toStation;
  final String fromTime;
  final String toTime;
  final String picture;
  final String prices;

  CatalogTrain(
      {this.train,
      this.trainCode,
      @required this.fromStation,
      @required this.toStation,
      @required this.fromTime,
      @required this.toTime,
      @required this.picture,
      @required this.prices,
      @required this.name});
  @override
  Widget build(BuildContext context) {
    var newFromTime = fromTime.split(" ");
    var newToTime = toTime.split(" ");
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
              builder: (_) => TrainDetails(
                trains: train,
              ),
            ),
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 50.0,
                right: 5.0,
                child: Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: "$prices/pax",
                              style: TextStyle(
                                  fontSize: 18.0, color: Colors.red[400])),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 10.0,
                left: 5.0,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: '${newFromTime[1]} to ${newToTime[1]}',
                              style: TextStyle(
                                  fontSize: 20, color: Colors.red[400])),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 30.0,
                left: 5.0,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0, top: 10.0),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: '$fromStation - $toStation',
                              style: TextStyle(
                                  fontSize: 24, color: Colors.red[400])),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                left: 5,
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, bottom: 10.0),
                      child: Text('$name',
                          style: TextStyle(
                            color: Colors.red[400],
                            fontSize: 20.0,
                          ))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
