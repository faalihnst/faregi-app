import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:faregi_app/scr/models/todo.dart';

class ThingsToDoDetails extends StatelessWidget {
  final ToDo toDo;

  ThingsToDoDetails(this.toDo);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 300,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  child: Image.network(
                    '${toDo.images}',
                    height: 400,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RichText(
                    text: TextSpan(
                        children: [
                          TextSpan(
                              text: '${toDo.name} \n',
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black)),
                          TextSpan(text: toDo.description)
                        ],
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey)),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    color: Colors.red[600],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: 'Price\n',
                                style: TextStyle(fontSize: 18)),
                            TextSpan(
                                text: '${toDo.ticketPrice}',
                                style: TextStyle(
                                    fontSize: 26, fontWeight: FontWeight.bold))
                          ]),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: GestureDetector(
                          onTap: () {
                            Flushbar(
                              flushbarStyle: FlushbarStyle.FLOATING,
                              animationDuration: Duration(milliseconds: 400),
                              duration: Duration(seconds: 3),
                              margin: EdgeInsets.all(12),
                              padding: EdgeInsets.all(14),
                              borderRadius: 8,
                              icon: Icon(Icons.warning, color: Colors.white),
                              messageText: Text('Fitur Booking Belum Tersedia',
                                  style: TextStyle(color: Colors.white)),
                              backgroundColor: Colors.orange,
                            ).show(context);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Book a Ticket',
                                style:
                                    TextStyle(color: Colors.pink, fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Positioned(
            top: 20,
            left: 10,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Align(
                alignment: Alignment.topLeft,
                child: Icon(Icons.arrow_back_ios),
              ),
            ),
          )
        ],
      ),
    );
  }
}
