import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:faregi_app/core/locators.dart';
import 'package:faregi_app/core/result.dart';
import 'package:faregi_app/core/services/api.dart';
import 'package:faregi_app/scr/models/city.dart';
import 'package:faregi_app/scr/widgets/explore_card.dart';


class Explores extends StatefulWidget {
  @override
  _ExploresState createState() => _ExploresState();
}

class _ExploresState extends State<Explores> {
  Api _api = locator<Api>();
  List<City> cities;

  getPicture() async {
    Result result = await _api.explore();
    if (result.resultType == ResultType.Success) cities = await result.data;
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
      future: getPicture(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: Text('Please wait its loading...'));
        } else {
          if (snapshot.hasError)
            return Center(child: Text('Error: ${snapshot.error}'));
          else
            return Container(
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: cities.length,
                    shrinkWrap: true,
                    itemBuilder: (_, index) {
                      return ExploreCard(
                        city: cities[index],
                        name: cities[index].city,
                        desc: cities[index].desc,
                        picture: cities[index].image,
                        toDo: cities[index].toDo,
                      );
                    })); // snapshot.data  :- get your object which is pass from your downloadData() function
        }
      },
    );
  }
}
