import 'package:flutter/material.dart';
import 'package:faregi_app/scr/models/cars.dart';
import 'package:faregi_app/scr/screens/car/car_details.dart';

class CatalogCar extends StatelessWidget {
  final String name;
  final Car car;
  final int seat;
  final String carType;
  final String picture;
  final String prices;
  final bool driver;

  CatalogCar(
      {this.car,
      @required this.seat,
      @required this.carType,
      @required this.picture,
      @required this.prices,
      @required this.name,
      @required this.driver});
  @override
  Widget build(BuildContext context) {
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
              builder: (_) => CarDetails(
                cars: car,
              ),
            ),
          );
        },
        child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Image.asset(
                        '$picture',
                        height: 100,
                        width: 200,
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.all(10.0),
                            padding: EdgeInsets.all(7.0),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1.0, color: Colors.red[400]),
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Text(
                              '$carType',
                              style: TextStyle(color: Colors.red[400]),
                            ),
                          ),
                          Icon(
                            Icons.person_outline,
                            color: Colors.red[400],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(
                              '$seat',
                              style: TextStyle(
                                color: Colors.red[400],
                                fontSize: 20.0,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        '$name',
                        style: TextStyle(
                          color: Colors.red[400],
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        driver == true ? 'With Driver' : 'Without Driver',
                        style: TextStyle(
                          color: Colors.red[400],
                          fontSize: 14.0,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        'Basic rental from',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Text(
                        'Rp. $prices/day',
                        style: TextStyle(
                          color: Colors.red[400],
                          fontSize: 18.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                    ],
                  )
                ],
              ),
            )),
      ),
    );
  }
}
