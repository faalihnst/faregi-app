import 'package:flutter/material.dart';
import 'package:faregi_app/core/locator.dart';
import 'package:faregi_app/core/view_model/car_viewmodel.dart';
import 'package:faregi_app/scr/models/cars.dart';
import 'package:faregi_app/scr/widgets/car_catalog.dart';

class CarList extends StatefulWidget {
  @override
  _CarListState createState() => _CarListState();
}

class _CarListState extends State<CarList> {
  CarModel _carModel = locator<CarModel>();
  List<Car> get cars => _carModel.cars;
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
                        children: List.generate(cars.length, (index) {
                          return CatalogCar(
                            car: cars[index],
                            carType: cars[index].carType,
                            driver: cars[index].driver,
                            prices: cars[index].price,
                            seat: cars[index].seat,
                            picture: cars[index].image,
                            name: cars[index].car,
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
