import 'package:faregi_app/core/locators.dart';
import 'package:faregi_app/core/result.dart';
import 'package:faregi_app/core/services/auth_service.dart';
import 'package:faregi_app/core/view_model/book_viewmodel.dart';
import 'package:faregi_app/scr/base.dart';
import 'package:faregi_app/scr/models/todo.dart';
import 'package:faregi_app/scr/screens/authentication/auth_screen.dart';
import 'package:faregi_app/scr/screens/things_to_do/thingstodo_details.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:faregi_app/scr/models/trip.dart';

class PackagesDetails extends StatefulWidget {
  final Trip trip;
  PackagesDetails({this.trip});
  @override
  _PackagesDetailsState createState() => _PackagesDetailsState();
}

class _PackagesDetailsState extends State<PackagesDetails> {
  AuthService _authService = locator<AuthService>();
  @override
  Widget build(BuildContext context) {
    return BaseView<BookModel>(
      onModelReady: (model) => model.init(),
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  child: ClipRect(
                      child: Image.network(
                    '${widget.trip.image}',
                    height: 400,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  )),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 16.0,
                      left: 16,
                    ),
                    child: Text(
                      "Travel to ${widget.trip.place}",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.only(left: 16.0),
                  leading: Icon(Icons.date_range),
                  title: Align(
                      alignment: Alignment(-1.2, 0),
                      child: Text(widget.trip.duration)),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text('From :', style: TextStyle(fontSize: 15)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          widget.trip.dateFrom,
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text('To :', style: TextStyle(fontSize: 15)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          widget.trip.dateTo,
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(height: 20),
                Container(
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: widget.trip.itenaryIds.length,
                      shrinkWrap: true,
                      itemBuilder: (_, index) {
                        return Timeline(
                          itenary: widget.trip.itenaryIds[index],
                          name: widget.trip.itenaryIds[index].name,
                          duration: widget.trip.itenaryIds[index].duration,
                          hour: widget.trip.itenaryIds[index].hour,
                          date: widget.trip.itenaryIds[index].date,
                          toDos: widget.trip.itenaryIds[index].todo,
                        );
                      }),
                ),
                SizedBox(height: 25),
                ButtonBar(
                  alignment: MainAxisAlignment.center,
                  buttonMinWidth: 200,
                  children: <Widget>[
                    FlatButton(
                      color: Colors.redAccent[400],
                      textColor: Colors.white,
                      disabledColor: Colors.grey,
                      disabledTextColor: Colors.black,
                      padding: EdgeInsets.all(8.0),
                      splashColor: Colors.red,
                      onPressed: () async {
                        print(_authService.currentUser.username);
                        if (_authService.currentUser.username ==
                            "public@mail.com") {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => AuthScreen()));
                        } else {
                          model.id = widget.trip.id;
                          Result result = await model.bookTrip();
                          model.flush(result).show(context);
                        }
                      },
                      child: Text(
                        "Book",
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Timeline extends StatelessWidget {
  final String date;
  final String name;
  final double duration;
  final String hour;
  final String image;
  final ItenaryId itenary;
  final ToDo toDos;

  Timeline({
    this.duration,
    this.name,
    this.date,
    this.hour,
    this.image,
    this.itenary,
    this.toDos,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        //all timeline row
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              Text('$date'),
              Text('$hour'),
            ],
          ),
          SizedBox(width: 20),
          GestureDetector(
            onTap: () {
              toDos != null
                  ? Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => ThingsToDoDetails(toDos)))
                  : Flushbar(
                      flushbarStyle: FlushbarStyle.FLOATING,
                      animationDuration: Duration(milliseconds: 400),
                      duration: Duration(seconds: 3),
                      margin: EdgeInsets.all(12),
                      padding: EdgeInsets.all(14),
                      borderRadius: 8,
                      icon: Icon(Icons.warning, color: Colors.white),
                      messageText: Text('Detail kegiatan tidak tersedia',
                          style: TextStyle(color: Colors.white)),
                      backgroundColor: Colors.orange,
                    );
            },
            child: Container(
              //timeline
              width: 300,
              child: Card(
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 50,
                      width: 70,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          '$image',
                          width: double.infinity,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          '$name',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text('$duration hours')
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
