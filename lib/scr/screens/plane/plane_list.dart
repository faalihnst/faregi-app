import 'package:flutter/material.dart';
import 'package:faregi_app/core/locator.dart';
import 'package:faregi_app/core/view_model/plane_viewmodel.dart';
import 'package:faregi_app/scr/models/planes.dart';
import 'package:faregi_app/scr/widgets/plane_catalog.dart';

class PlaneList extends StatefulWidget {
  @override
  _PlaneListState createState() => _PlaneListState();
}

class _PlaneListState extends State<PlaneList> {
  PlaneModel _planeModel = locator<PlaneModel>();
  List<Plane> get planes => _planeModel.planes;
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
                        children: List.generate(planes.length, (index) {
                          return CatalogPlane(
                            plane: planes[index],
                            fromTime: planes[index].fromTime,
                            toTime: planes[index].toTime,
                            prices: planes[index].price,
                            fromAirport: planes[index].fromAirport,
                            toAirport: planes[index].toAirport,
                            picture: planes[index].image,
                            name: planes[index].plane,
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
