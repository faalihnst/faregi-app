import 'package:flutter/material.dart';
import 'input_box.dart';

class NumberOfTraveller extends StatelessWidget {
  NumberOfTraveller(
      {this.action,
      this.adultCon,
      this.childCon,
      this.infantCon,
      this.suppController});
  final Widget action;
  final Function adultCon;
  final Function childCon;
  final Function infantCon;
  final TextEditingController suppController;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 0.0),
      title: Text('Number of Traveller'),
      content: Container(
        width: 1100.0,
        child: Row(
          children: <Widget>[
            Expanded(
              child: InputBox(
                images: 'images/man.png',
                spaceAfter: 1.0,
                label: 'Adult',
                keyboard: TextInputType.number,
                onChanged: adultCon,
                controller: suppController,
              ),
            ),
            Expanded(
              child: InputBox(
                images: 'images/young.png',
                spaceAfter: 1.0,
                label: 'Child',
                keyboard: TextInputType.number,
                onChanged: childCon,
                controller: suppController,
              ),
            ),
            Expanded(
              child: InputBox(
                images: 'images/boy.png',
                spaceAfter: 2.0,
                label: 'Infant',
                keyboard: TextInputType.number,
                onChanged: infantCon,
                controller: suppController,
              ),
            )
          ],
        ),
      ),
      actions: <Widget>[
        action,
      ],
    );
  }
}
