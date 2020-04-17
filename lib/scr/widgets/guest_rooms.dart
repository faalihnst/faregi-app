import 'package:flutter/material.dart';
import 'input_box.dart';

class GuestsAndRooms extends StatelessWidget {
  GuestsAndRooms(
      {this.action, this.roomCon, this.guestCon, this.suppController});
  final Widget action;
  final Function roomCon;
  final Function guestCon;
  final TextEditingController suppController;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
      title: Text('Guest(s) and Room(s)'),
      content: Container(
        child: Row(
          children: <Widget>[
            Expanded(
              child: InputBox(
                images: 'images/guest.png',
                spaceAfter: 1.0,
                label: 'Guest(s)',
                keyboard: TextInputType.number,
                onChanged: guestCon,
                controller: suppController,
              ),
            ),
            Expanded(
              child: InputBox(
                images: 'images/door.png',
                spaceAfter: 2.0,
                label: 'Room(s)',
                keyboard: TextInputType.number,
                onChanged: roomCon,
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
