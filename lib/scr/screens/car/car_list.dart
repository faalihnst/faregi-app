import 'package:flutter/material.dart';
import 'package:faregi_app/core/locators.dart';
import 'package:faregi_app/core/view_model/car_viewmodel.dart';
import 'package:faregi_app/scr/models/cars.dart';
import 'package:faregi_app/scr/widgets/car_catalog.dart';

class CarList extends StatefulWidget {
  final List<Car> cars;
  CarList({this.cars});
  @override
  _CarListState createState() => _CarListState();
}

class _CarListState extends State<CarList> {
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
                        children: List.generate(widget.cars.length, (index) {
                          return CatalogCar(
                            car: widget.cars[index],
                            carType: widget.cars[index].carType,
                            driver: widget.cars[index].driver,
                            prices: widget.cars[index].price,
                            seat: widget.cars[index].seat,
                            picture: widget.cars[index].image,
                            name: widget.cars[index].car,
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
