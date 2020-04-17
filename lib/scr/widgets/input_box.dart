import 'package:flutter/material.dart';

class InputBox extends StatelessWidget {
  InputBox({
    this.label,
    this.images,
    this.spaceAfter,
    this.keyboard,
    this.controller,
    this.onChanged,
  });
  final String label;
  final String images;
  final double spaceAfter;
  final TextInputType keyboard;
  final TextEditingController controller;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: spaceAfter,
        ),
        Image(
          image: AssetImage(images),
          width: 30.0,
          height: 40.0,
        ),
        SizedBox(
          width: 10.0,
        ),
        Expanded(
          child: TextField(
            keyboardType: keyboard,
            controller: controller,
            onChanged: onChanged,
            decoration: InputDecoration(
              labelText: label,
              border: OutlineInputBorder(),
            ),
          ),
        ),
        SizedBox(
          width: spaceAfter,
        )
      ],
    );
  }
}
