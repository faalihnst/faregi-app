import 'package:flutter/material.dart';

class ButtonSection extends StatelessWidget {
  ButtonSection({this.onPressed, this.label});
  final VoidCallback onPressed;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 40.0,
      padding: EdgeInsets.symmetric(horizontal: 60.0),
      margin: EdgeInsets.only(top: 30.0),
      child: RaisedButton(
        onPressed: onPressed,
        elevation: 0.0,
        color: Colors.red[400],
        child:
            Text(label, style: TextStyle(color: Colors.white, fontSize: 16.0)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
    );
  }
}
