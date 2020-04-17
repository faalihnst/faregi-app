import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:faregi_app/core/result.dart';
import 'package:faregi_app/core/view_model/todo_viewmodel.dart';
import 'package:faregi_app/scr/base.dart';
import 'package:faregi_app/scr/models/todo.dart';
import 'package:faregi_app/scr/widgets/todo_card.dart';

class ToDoCatalog extends StatefulWidget {
  @override
  _ToDoCatalogState createState() => _ToDoCatalogState();
}

class _ToDoCatalogState extends State<ToDoCatalog> {
  @override
  Widget build(BuildContext context) {
    return BaseView<ToDoModel>(
      onModelReady: (model) async {
        Result result = await model.getToDo();
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
        children: List.generate(model.todos.length, (index) {
          return ToDoCard(
            toDo: model.todos[index],
            name: model.todos[index].name,
            price: model.todos[index].ticketPrice,
            picture: model.todos[index].images,
          );
        }),
      ),
    );
  }
}
