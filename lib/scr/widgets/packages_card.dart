import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:faregi_app/core/result.dart';
import 'package:faregi_app/core/view_model/package_viewmodel.dart';
import 'package:faregi_app/scr/base.dart';
import 'package:faregi_app/scr/models/trip.dart';
import 'package:faregi_app/scr/models/todo.dart';
import 'package:faregi_app/scr/screens/packages/packages_details.dart';

class PackageCard extends StatelessWidget {
  final String name;
  final String duration;
  final String picture;
  final Trip place;
  final String price;
  final List<ToDo> toDo;

  PackageCard({
    this.name,
    this.duration,
    this.picture,
    this.place,
    this.toDo,
    this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      color: Colors.white70,
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
                  builder: (_) => PackagesDetail(
                        trip: place,
                      )));
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            children: <Widget>[
              Image.asset(
                "images/$picture",
                height: double.infinity,
                width: 200,
                fit: BoxFit.cover,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    width: 200,
                    decoration: BoxDecoration(
                      // Box decoration takes a gradient
                      gradient: LinearGradient(
                        // Where the linear gradient begins and ends
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        // Add one stop for each color. Stops should increase from 0 to 1
                        colors: [
                          // Colors are easy thanks to Flutter's Colors class.
                          Colors.black.withOpacity(0.8),
                          Colors.black.withOpacity(0.7),
                          Colors.black.withOpacity(0.6),
                          Colors.black.withOpacity(0.6),
                          Colors.black.withOpacity(0.4),
                          Colors.black.withOpacity(0.1),
                          Colors.black.withOpacity(0.05),
                          Colors.black.withOpacity(0.025),
                        ],
                      ),
                    ),
                    child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Container())),
              ),
              Positioned(
                top: 10,
                left: 5,
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.calendar_today,
                            color: Colors.white,
                            size: 14,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text('$duration',
                              style: TextStyle(color: Colors.white))
                        ],
                      )),
                ),
              ),
              Positioned(
                bottom: 30,
                left: 5,
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: '$name ', style: TextStyle(fontSize: 22)),
                      ]))),
                ),
              ),
              Positioned(
                  bottom: 10,
                  left: 5,
                  child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: 'Rp. $price ',
                              style: TextStyle(fontSize: 12)),
                        ]),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}

class PackageCatalog extends StatefulWidget {
  @override
  _PackageCatalogState createState() => _PackageCatalogState();
}

class _PackageCatalogState extends State<PackageCatalog> {
  @override
  Widget build(BuildContext context) {
    return BaseView<PackageModel>(
      onModelReady: (model) async {
        Result result = await model.getPackage();
        if (result.resultType == ResultType.Success)
          print('success');
        else
          model.flush(result).show(context);
      },
      builder: (context, model, child) => GridView.count(
        scrollDirection: Axis.vertical,
        primary: true,
        padding: const EdgeInsets.all(20),
        crossAxisCount: 2,
        children: List.generate(model.trips.length, (index) {
          return PackageCard(
            place: model.trips[index],
            name: model.trips[index].place,
            duration: model.trips[index].duration,
            picture: model.trips[index].image,
            price: model.trips[index].price,
          );
        }),
      ),
    );
  }
}
