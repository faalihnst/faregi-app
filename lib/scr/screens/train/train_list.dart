import 'package:flutter/material.dart';
import 'package:faregi_app/core/locator.dart';
import 'package:faregi_app/core/view_model/train_viewmodel.dart';
import 'package:faregi_app/scr/models/trains.dart';
import 'package:faregi_app/scr/widgets/train_catalog.dart';

class TrainList extends StatefulWidget {
  @override
  _TrainListState createState() => _TrainListState();
}

class _TrainListState extends State<TrainList> {
  TrainModel _trainModel = locator<TrainModel>();
  List<Train> get trains => _trainModel.trains;
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
                        children: List.generate(trains.length, (index) {
                          return CatalogTrain(
                            train: trains[index],
                            fromTime: trains[index].fromTime,
                            toTime: trains[index].toTime,
                            prices: trains[index].price,
                            fromStation: trains[index].fromStation,
                            toStation: trains[index].toStation,
                            picture: trains[index].image,
                            name: trains[index].train,
                            trainCode: trains[index].trainCode,
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
