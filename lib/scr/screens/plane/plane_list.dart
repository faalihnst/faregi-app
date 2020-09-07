import 'package:flutter/material.dart';
import 'package:faregi_app/scr/models/planes.dart';
import 'package:faregi_app/scr/widgets/plane_catalog.dart';

class PlaneList extends StatefulWidget {
  final List<Plane> planes;
  PlaneList({this.planes});
  @override
  _PlaneListState createState() => _PlaneListState();
}

class _PlaneListState extends State<PlaneList> {
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
                        children: List.generate(widget.planes.length, (index) {
                          return CatalogPlane(
                            plane: widget.planes[index],
                            fromTime: widget.planes[index].fromTime,
                            toTime: widget.planes[index].toTime,
                            prices: widget.planes[index].price,
                            fromAirport: widget.planes[index].fromAirport,
                            toAirport: widget.planes[index].toAirport,
                            picture: widget.planes[index].image,
                            name: widget.planes[index].plane,
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
