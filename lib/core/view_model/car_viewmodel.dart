import 'package:faregi_app/core/locator.dart';
import 'package:faregi_app/core/result.dart';
import 'package:faregi_app/core/view_model/base_viewmodel.dart';
import 'package:faregi_app/core/services/api.dart';
import 'package:faregi_app/scr/models/cars.dart';
import 'package:faregi_app/scr/models/trains.dart';

class CarModel extends BaseModel {
  Api _api = locator<Api>();
  List<Car> cars = List<Car>();
  String errorMessage;
  String location;

  void init() async {
    setBusy(true);
    errorMessage = '';
    setBusy(false);
  }

  Future getCar() async {
    setBusy(true);
    Result result = await _api.car(location);
    if (result.resultType == ResultType.Success) cars = await result.data;
    setBusy(false);
    return result;
  }
}
