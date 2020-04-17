import 'package:flutter/material.dart';
import 'package:md2_tab_indicator/md2_tab_indicator.dart';
import 'package:faregi_app/scr/screens/authentication/login.dart';
import 'package:faregi_app/scr/screens/authentication/register.dart';
import 'package:faregi_app/scr/screens/ui_helper.dart';
import 'package:faregi_app/scr/base.dart';
import 'package:faregi_app/core/view_model/auth_viewmodel.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    UIHelper.init(context);
    return BaseView<AuthViewModel>(
        onModelReady: (model) => model.init(),
        builder: (context, model, child) => DefaultTabController(
              length: 2,
              child: Scaffold(
                body: SafeArea(
                    child: Container(
                  color: Colors.orange[50],
                  child: ListView(
                    shrinkWrap: true,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(
                            right: 20.0, left: 20.0, top: 100.0, bottom: 20.0),
                        child: Image(
                          image: AssetImage('images/fare.gi.png'),
                          height: 150.0,
                        ),
                      ),
                      Center(
                        child: TabBar(
                          labelStyle: TextStyle(
                              //up to your taste
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                          indicatorSize:
                              TabBarIndicatorSize.label, //makes it better
                          labelColor: Colors.red[400], //Google's sweet blue
                          unselectedLabelColor:
                              Color(0xff5f6368), //niceish grey
                          isScrollable: true, //up to your taste
                          indicator: MD2Indicator(
                              //it begins here
                              indicatorHeight: 3,
                              indicatorColor: Colors.red[400],
                              indicatorSize: MD2IndicatorSize
                                  .full //3 different modes tiny-normal-full
                              ),
                          tabs: <Widget>[
                            Tab(
                              text: "Login",
                            ),
                            Tab(
                              text: "Register",
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height,
                        child: TabBarView(
                          children: <Widget>[LoginScreen(), RegisterScreen()],
                        ),
                      )
                    ],
                  ),
                )),
              ),
            ));
  }
}
