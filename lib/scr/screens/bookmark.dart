import 'package:faregi_app/scr/widgets/bookmarks_card.dart';
import 'package:flutter/material.dart';

class Bookmarks extends StatelessWidget {
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
                  Expanded(child: Container(child: BookmarkCatalog())),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
