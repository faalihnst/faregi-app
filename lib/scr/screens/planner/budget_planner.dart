import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:faregi_app/scr/screens/planner/accomodation_planner.dart';
import 'package:faregi_app/scr/widgets/icon_card.dart';
import 'package:faregi_app/scr/constant.dart';
import 'package:faregi_app/scr/widgets/input_box.dart';
import '../ui_helper.dart';

enum Transport { plane, train, bus, none }

class BudgetPlanner extends StatefulWidget {
  @override
  _BudgetPlannerState createState() => _BudgetPlannerState();
}

class _BudgetPlannerState extends State<BudgetPlanner> {
  Transport selectedTransport;
  String transport;
  int budgetFrom;
  int budgetTo;
  @override
  Widget build(BuildContext context) {
    UIHelper.init(context);
    return Scaffold(
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
                  width: 300.0,
                  height: 550.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 30.0,
                      ),
                      Text(
                        'What\'s Your Budget?',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      InputBox(
                        label: 'From',
                        images: 'images/rupiah-currency-symbol.png',
                        spaceAfter: 20.0,
                        onChanged: (value) => budgetFrom = value,
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      InputBox(
                        label: 'To',
                        images: 'images/rupiah-currency-symbol.png',
                        spaceAfter: 20.0,
                        onChanged: (value) {
                          setState(() {
                            budgetTo = value;
                          });
                        },
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      Text(
                        'Transportation',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          IconCard(
                            iconData: Icons.flight,
                            text: 'Flights',
                            pressed: () {
                              setState(() {
                                selectedTransport = Transport.plane;
                              });
                            },
                            stateColor: selectedTransport == Transport.plane
                                ? kActiveColor
                                : kInActiveColor,
                          ),
                          IconCard(
                            iconData: Icons.directions_railway,
                            text: 'Trains',
                            pressed: () {
                              setState(() {
                                selectedTransport = Transport.train;
                              });
                            },
                            stateColor: selectedTransport == Transport.train
                                ? kActiveColor
                                : kInActiveColor,
                          ),
                          IconCard(
                            iconData: Icons.directions_bus,
                            text: 'Bus',
                            pressed: () {
                              setState(() {
                                selectedTransport = Transport.bus;
                              });
                            },
                            stateColor: selectedTransport == Transport.bus
                                ? kActiveColor
                                : kInActiveColor,
                          ),
                          IconCard(
                            iconData: Icons.highlight_off,
                            text: 'By Myself',
                            pressed: () {
                              setState(() {
                                selectedTransport = Transport.none;
                              });
                            },
                            stateColor: selectedTransport == Transport.none
                                ? kActiveColor
                                : kInActiveColor,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                GestureDetector(
                  onTap: () {
                    print('budgetto = $budgetTo');
                    print('budgetfrom = $budgetFrom');
                    if (selectedTransport == Transport.plane)
                      transport = 'Plane';
                    else if (selectedTransport == Transport.train)
                      transport = 'Train';
                    else if (selectedTransport == Transport.bus)
                      transport = 'Car';
                    else
                      transport = 'None';
                    print('transport = $transport');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => AccommodationPlanner(
                                  transport: transport,
                                  budgetFrom: budgetFrom,
                                  budgetTo: budgetTo,
                                )));
                  },
                  child: Container(
                    height: 50.0,
                    width: 150.0,
                    child: Center(
                      child: Text(
                        'Submit',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontFamily: 'Libre Baskerville',
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
      ),
    );
  }
}
