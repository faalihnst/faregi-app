import 'package:flutter/material.dart';
import 'package:faregi_app/core/locators.dart';
import 'package:faregi_app/scr/screens/welcome.dart';

void main() {
  setupLocator();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Welcome(),
  ));
}
