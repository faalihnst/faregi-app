import 'package:faregi_app/core/locator.dart';
import 'package:faregi_app/core/result.dart';
import 'package:faregi_app/core/view_model/base_viewmodel.dart';
import 'package:faregi_app/core/services/api.dart';
import 'package:faregi_app/scr/models/cars.dart';
import 'package:faregi_app/scr/models/city.dart';
import 'package:faregi_app/scr/models/todo.dart';
import 'package:faregi_app/scr/models/trains.dart';
import 'package:faregi_app/scr/models/trip.dart';

class PackageModel extends BaseModel {
  Api _api = locator<Api>();
  List<Trip> trips = List<Trip>();
  String errorMessage;

  Future getPackage() async {
    setBusy(true);
    Result result = await _api.package();
    if (result.resultType == ResultType.Success) trips = await result.data;
    setBusy(false);
    return result;
  }
}
