import 'package:faregi_app/core/result.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class BaseModel extends ChangeNotifier {
  bool _busy = false;

  bool get isBusy => _busy;

  void setBusy(bool val) {
    _busy = val;
    notifyListeners();
  }

  Flushbar flush(Result<dynamic> result) {
    return Flushbar(
      flushbarStyle: FlushbarStyle.FLOATING,
      animationDuration: Duration(milliseconds: 400),
      duration: Duration(seconds: 3),
      margin: EdgeInsets.all(12),
      padding: EdgeInsets.all(14),
      borderRadius: 8,
      icon: Icon(result.iconData, color: Colors.white),
      messageText: Text(result.message, style: TextStyle(color: Colors.white)),
      backgroundColor: result.resultType == ResultType.Success
          ? Colors.green
          : result.resultType == ResultType.Warning
              ? Colors.orange
              : Colors.red,
    );
  }
}
