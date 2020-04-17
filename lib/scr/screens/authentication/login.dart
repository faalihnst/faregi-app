import 'package:flutter/material.dart';
import 'package:faregi_app/core/view_model/auth_viewmodel.dart';
import 'package:faregi_app/scr/screens/home.dart';
import 'package:faregi_app/core/result.dart';
import 'package:faregi_app/scr/widgets/button_section.dart';
import 'package:faregi_app/scr/widgets/floating_input_box.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool _isLoading = false;
    final model = Provider.of<AuthViewModel>(context);
    return Material(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.orange[50], Colors.red[400]],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: _isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(horizontal: 60.0),
                    child: Column(
                      children: <Widget>[
                        FloatingInputBox(
                          'Email',
                          onChanged: (value) => model.username = value,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        FloatingInputBox(
                          'Password',
                          onChanged: (value) => model.password = value,
                          obscureText: true,
                        ),
                      ],
                    ),
                  ),
                  ButtonSection(
                      label: 'Login',
                      onPressed: () async {
                        print('username: ${model.username}');
                        print('password: ${model.password}');
                        Result result = await model.login();
                        if (result.resultType == ResultType.Success)
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => Home()));
                        else
                          model.flush(result).show(context);
                      }),
                ],
              ),
      ),
    );
  }
}
