import 'package:flutter/material.dart';

class IconCard extends StatelessWidget {
  final IconData iconData;
  final String text;
  final Function pressed;
  final Color stateColor;
  IconCard({this.iconData, this.text, this.pressed, this.stateColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: Column(
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
                color: stateColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: IconButton(
                icon: Icon(
                  iconData,
                  size: 30,
                  color: Colors.redAccent[400],
                ),
                onPressed: pressed,
              )),
          SizedBox(
            height: 5.0,
          ),
          Text(
            text,
            style: TextStyle(fontSize: 10),
          )
        ],
      ),
    );
  }
}
