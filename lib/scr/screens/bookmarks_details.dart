import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:faregi_app/scr/models/trip.dart';

class BookmarkDetails extends StatefulWidget {
  final Trip trip;
  BookmarkDetails({this.trip});
  @override
  _BookmarkDetailsState createState() => _BookmarkDetailsState();
}

class _BookmarkDetailsState extends State<BookmarkDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                child: ClipRect(
                    child: Image.asset(
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
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
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
                      );
                    }),
              ),
              SizedBox(height: 25),
            ],
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

  Timeline(
      {this.duration,
      this.name,
      this.date,
      this.hour,
      this.image,
      this.itenary});
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
          Container(
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
        ],
      ),
    );
  }
}
