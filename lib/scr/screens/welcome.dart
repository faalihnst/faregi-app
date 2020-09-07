import 'package:faregi_app/core/result.dart';
import 'package:faregi_app/core/view_model/auth_viewmodel.dart';
import 'package:faregi_app/scr/base.dart';
import 'package:faregi_app/scr/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:faregi_app/scr/screens/ui_helper.dart';


class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UIHelper.init(context);
    return BaseView<AuthViewModel>(
      onModelReady: (model) => model.init(),
      builder: (context, model, child) =>Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            'images/5.PNG',
            fit: BoxFit.fill,
            height: double.infinity,
            width: double.infinity,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                height: 400,
                width: double.infinity,
                decoration: BoxDecoration(
                  // Box decoration takes a gradient
                  gradient: LinearGradient(
                    // Where the linear gradient begins and ends
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    // Add one stop for each color. Stops should increase from 0 to 1
                    colors: [
                      // Colors are easy thanks to Flutter's Colors class.
//                      Colors.redAccent[400].withOpacity(1),
//
//                      Colors.redAccent[400].withOpacity(0.9),
//
//                      Colors.redAccent[400].withOpacity(0.8),
//                      Colors.redAccent[400].withOpacity(0.7),
                      //                      Colors.redAccent[400].withOpacity(0.6),
//                      Colors.redAccent[400].withOpacity(0.5),
                      Colors.redAccent[400].withOpacity(0.4),
                      Colors.redAccent[400].withOpacity(0.1),
                      Colors.redAccent[400].withOpacity(0.05),
                      Colors.redAccent[400].withOpacity(0.025),
                    ],
                  ),
                ),
                child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Container())),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 40.0,
              ),
              Image(
                image: AssetImage('images/fare.gi.png'),
                height: 150.0,
              ),
              SizedBox(
                height: 30.0,
              ),
              Container(
                width: 200.0,
                height: 80.0,
                child: Image.asset(
                  'images/fare.gi-font.png',
                  fit: BoxFit.fill,
                ),
              ),
              Text(
                '______________________________________________',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "A place where budget \n can bring you enjoyable trips",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 200,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: GestureDetector(
                  onTap: () async {
                    model.username = "public@mail.com";
                    model.password = "123";
                    Result result = await model.login();
                    if (result.resultType == ResultType.Success)
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => Home()));
                        else
                          model.flush(result).show(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.pink,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    )
    );
  }
}
