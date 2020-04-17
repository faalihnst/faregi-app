import 'package:flutter/material.dart';
import 'package:faregi_app/core/result.dart';
import 'package:faregi_app/core/view_model/todo_viewmodel.dart';
import 'package:faregi_app/scr/base.dart';
import 'package:faregi_app/scr/widgets/thingstodo_catalog.dart';

class ThingsToDo extends StatelessWidget {
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
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(child: Container(child: ToDoCatalog())),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
