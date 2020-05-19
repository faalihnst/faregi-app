import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:faregi_app/core/locators.dart';
import 'package:faregi_app/core/result.dart';
import 'package:faregi_app/core/services/api.dart';
import 'package:faregi_app/scr/models/todo.dart';
import 'package:faregi_app/scr/widgets/todo_card.dart';

class AffordTours extends StatefulWidget {
  @override
  _AffordToursState createState() => _AffordToursState();
}

class _AffordToursState extends State<AffordTours> {
  Api _api = locator<Api>();
  List<ToDo> toDo;

  getPicture() async {
    Result result = await _api.todo();
    if (result.resultType == ResultType.Success) toDo = await result.data;
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
                    itemCount: toDo.length,
                    shrinkWrap: true,
                    itemBuilder: (_, index) {
                      return ToDoCard(
                        toDo: toDo[index],
                        name: toDo[index].name,
                        price: toDo[index].ticketPrice,
                        picture: toDo[index].images,
                      );
                    })); // snapshot.data  :- get your object which is pass from your downloadData() function
        }
      },
    );
  }
}
