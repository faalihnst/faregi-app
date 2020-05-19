import 'package:faregi_app/core/locators.dart';
import 'package:faregi_app/core/result.dart';
import 'package:faregi_app/core/view_model/base_viewmodel.dart';
import 'package:faregi_app/core/services/api.dart';
import 'package:faregi_app/scr/models/cars.dart';
import 'package:faregi_app/scr/models/hotels.dart';
import 'package:faregi_app/scr/models/trains.dart';

class BookModel extends BaseModel {
  Api _api = locator<Api>();
  String errorMessage;
  int id;

  void init() async {
    setBusy(true);
    errorMessage = '';
    setBusy(false);
  }

  Future bookTrip() async {
    setBusy(true);
    Result result = await _api.book(id);
    setBusy(false);
    return result;
  }
}
