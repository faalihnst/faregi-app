import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:faregi_app/core/result.dart';
import 'package:faregi_app/scr/base.dart';
import 'package:faregi_app/scr/widgets/guest_rooms.dart';
import 'package:faregi_app/scr/widgets/input_box.dart';
import 'hotel_list.dart';
import 'package:faregi_app/core/view_model/hotel_viewmodel.dart';

class HotelBook extends StatefulWidget {
  @override
  _HotelBookState createState() => _HotelBookState();
}

class _HotelBookState extends State<HotelBook> {
  DateTime dateTime;
  String finalDateDepart;
  int guestNum = 0;
  int roomNum = 0;
  var dateFormatNow =
      "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}";
  @override
  Widget build(BuildContext context) {
    return BaseView<HotelModel>(
      onModelReady: (model) => model.init(),
      builder: (context, model, child) => Scaffold(
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
            child: Center(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 50.0,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.65,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        SizedBox(
                          height: 30.0,
                        ),
                        InputBox(
                          label: 'Location',
                          images: 'images/marker.png',
                          spaceAfter: 20.0,
                          onChanged: (value) => model.location = value,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                  width: 25.0,
                                ),
                                Text(
                                  'Check in Date',
                                  style: TextStyle(fontSize: 18.0),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.date_range,
                                  size: 30.0,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2010),
                                      lastDate: DateTime(2100),
                                    ).then((date) {
                                      setState(() {
                                        dateTime = date;
                                        var dateFormat =
                                            "${dateTime.day}-${dateTime.month}-${dateTime.year}";
                                        finalDateDepart = dateFormat;
                                      });
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10.0, vertical: 10.0),
                                    width: 100.0,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Colors.grey,
                                          width: 1.0,
                                        ),
                                      ),
                                    ),
                                    child: Text(
                                      finalDateDepart != null
                                          ? finalDateDepart
                                          : dateFormatNow,
                                      style: TextStyle(fontSize: 16.0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Expanded(
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Duration',
                                style: TextStyle(fontSize: 18.0),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Container(
                                height: 50.0,
                                width: 125.0,
                                child: InputBox(
                                  label: 'Night(s)',
                                  images: 'images/moon.png',
                                  keyboard: TextInputType.number,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          'Guest and Rooms',
                          style: TextStyle(
                            fontSize: 24.0,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              guestNum = 0;
                              roomNum = 0;
                              return showDialog(
                                  context: context,
                                  builder: (context) {
                                    return GuestsAndRooms(
                                      guestCon: (String guest) {
                                        setState(
                                          () {
                                            guestNum = int.parse(guest);
                                          },
                                        );
                                      },
                                      roomCon: (String room) {
                                        setState(
                                          () {
                                            roomNum = int.parse(room);
                                          },
                                        );
                                      },
                                      action: RaisedButton(
                                        color: Colors.red[400],
                                        onPressed: () {
                                          setState(() {});
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('Submit'),
                                      ),
                                    );
                                  });
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(15.0),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child:
                                Text('$guestNum Guest(s) and $roomNum Room(s)'),
                          ),
                        ),
                        SizedBox(
                          height: 50.0,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 50.0,
                      width: 150.0,
                      child: Center(
                        child: GestureDetector(
                          onTap: () async {
                            print(model.location);
                            Result result = await model.getHotel();
                            if (result.resultType == ResultType.Success) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => HotelList(
                                            hotels: model.hotels,
                                          )));
                              print(model.hotels[0].hotel);
                            } else
                              model.flush(result).show(context);
                          },
                          child: Text(
                            'Submit',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Libre Baskerville',
                            ),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Colors.redAccent[400],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
