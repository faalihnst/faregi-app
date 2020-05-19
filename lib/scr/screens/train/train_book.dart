import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:faregi_app/core/result.dart';
import 'package:faregi_app/core/view_model/train_viewmodel.dart';
import 'package:faregi_app/scr/base.dart';
import 'package:faregi_app/scr/screens/train/train_list.dart';
import 'package:faregi_app/scr/widgets/input_box.dart';
import 'package:faregi_app/scr/widgets/no_traveller.dart';
import '../ui_helper.dart';

class TrainBook extends StatefulWidget {
  @override
  _TrainBookState createState() => _TrainBookState();
}

class _TrainBookState extends State<TrainBook> {
  DateTime dateTime;
  String finalDateDepart;
  String finalDateReturn;
  int adultNum;
  int childNum;
  int infantNum;
  int travelNum = 0;
  var dateFormatNow =
      "${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}";
  @override
  Widget build(BuildContext context) {
    UIHelper.init(context);
    return BaseView<TrainModel>(
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
                      height: 50.0,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.height * 0.7,
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
                            label: 'From',
                            images: 'images/marker.png',
                            spaceAfter: 20.0,
                            onChanged: (value) => model.from,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          InputBox(
                            label: 'To',
                            images: 'images/marker.png',
                            spaceAfter: 20.0,
                            onChanged: (value) => model.to,
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
                                    'Departure',
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
                                          model.departureDate = finalDateDepart;
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
                          Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(
                                    width: 25.0,
                                  ),
                                  Text(
                                    'Return',
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
                                              "${dateTime.year}-${dateTime.month}-${dateTime.day}";
                                          finalDateReturn = dateFormat;
                                          model.returnDate = finalDateReturn;
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
                          Text(
                            'Number of Traveller',
                            style: TextStyle(
                              fontSize: 24.0,
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          GestureDetector(
                            onTap: () async {
                              travelNum = 0;
                              adultNum = 0;
                              childNum = 0;
                              infantNum = 0;
                              return await showDialog(
                                  context: context,
                                  builder: (context) {
                                    return NumberOfTraveller(
                                      adultCon: (String adult) {
                                        setState(
                                          () {
                                            adultNum = int.parse(adult);
                                          },
                                        );
                                      },
                                      childCon: (String child) {
                                        setState(
                                          () {
                                            childNum = int.parse(child);
                                          },
                                        );
                                      },
                                      infantCon: (String infant) {
                                        setState(
                                          () {
                                            infantNum = int.parse(infant);
                                          },
                                        );
                                      },
                                      action: RaisedButton(
                                        color: Colors.red[400],
                                        onPressed: () {
                                          setState(() {
                                            travelNum =
                                                adultNum + childNum + infantNum;
                                          });
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('Submit'),
                                      ),
                                    );
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
                              child: Text('$travelNum Penumpang'),
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
                              print(model.from);
                              print(model.to);
                              print(model.departureDate);
                              print(model.returnDate);
                              Result result = await model.getTrain();
                              if (result.resultType == ResultType.Success) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => TrainList(
                                              trains: model.trains,
                                            )));
                                print(model.trains[0].train);
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
