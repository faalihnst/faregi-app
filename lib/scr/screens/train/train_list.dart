import 'package:flutter/material.dart';
import 'package:faregi_app/scr/models/trains.dart';
import 'package:faregi_app/scr/widgets/train_catalog.dart';

class TrainList extends StatefulWidget {
  final List<Train> trains;
  TrainList({this.trains});
  @override
  _TrainListState createState() => _TrainListState();
}

class _TrainListState extends State<TrainList> {
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
                        children: List.generate(widget.trains.length, (index) {
                          return CatalogTrain(
                            train: widget.trains[index],
                            fromTime: widget.trains[index].fromTime,
                            toTime: widget.trains[index].toTime,
                            prices: widget.trains[index].price,
                            fromStation: widget.trains[index].fromStation,
                            toStation: widget.trains[index].toStation,
                            picture: widget.trains[index].image,
                            name: widget.trains[index].train,
                            trainCode: widget.trains[index].trainCode,
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
