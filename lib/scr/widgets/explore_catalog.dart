import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:faregi_app/core/result.dart';
import 'package:faregi_app/core/view_model/city_viewmodel.dart';
import 'package:faregi_app/scr/base.dart';
import 'package:faregi_app/scr/widgets/explore_card.dart';

class ExploreCatalog extends StatefulWidget {
  @override
  _ExploreCatalogState createState() => _ExploreCatalogState();
}

class _ExploreCatalogState extends State<ExploreCatalog> {
  @override
  Widget build(BuildContext context) {
    return BaseView<CityModel>(
      onModelReady: (model) async {
        Result result = await model.getCity();
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
        children: List.generate(model.cities.length, (index) {
          return ExploreCard(
            city: model.cities[index],
            name: model.cities[index].city,
            desc: model.cities[index].desc,
            picture: model.cities[index].image,
            toDo: model.cities[index].toDo,
          );
        }),
      ),
    );
  }
}
