import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:faregi_app/core/result.dart';
import 'package:faregi_app/core/view_model/car_viewmodel.dart';
import 'package:faregi_app/scr/base.dart';
import 'package:faregi_app/scr/widgets/input_box.dart';
import 'car_list.dart';
import '../ui_helper.dart';

class CarBook extends StatefulWidget {
  @override
  _CarBookState createState() => _CarBookState();
}

class _CarBookState extends State<CarBook> {
  DateTime dateTime;
  String finalDateDepart;
  String finalDateReturn;
  var dateFormatNow =
      "${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}";
  @override
  Widget build(BuildContext context) {
    UIHelper.init(context);
    return BaseView<CarModel>(
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
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 135.0,
                    ),
                    Container(
                      width: 300.0,
                      height: 400.0,
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
                                    'Start Date',
                                    style: TextStyle(fontSize: 20),
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
                          Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(
                                    width: 25.0,
                                  ),
                                  Text(
                                    'End Date',
                                    style: TextStyle(fontSize: 20),
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
                                          finalDateReturn = dateFormat;
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
                                        finalDateReturn != null
                                            ? finalDateReturn
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
                            height: 30.0,
                          ),
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
                              Result result = await model.getCar();
                              if (result.resultType == ResultType.Success) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => CarList()));
                                print(model.cars[0].car);
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
            ),
          )),
    );
  }
}
