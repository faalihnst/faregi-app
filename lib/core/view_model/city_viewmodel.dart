import 'package:faregi_app/core/locators.dart';
import 'package:faregi_app/core/result.dart';
import 'package:faregi_app/core/view_model/base_viewmodel.dart';
import 'package:faregi_app/core/services/api.dart';
import 'package:faregi_app/scr/models/city.dart';


class CityModel extends BaseModel {
  Api _api = locator<Api>();
  List<City> cities = List<City>();
  String errorMessage;

  Future getCity() async {
    setBusy(true);
    Result result = await _api.explore();
    if (result.resultType == ResultType.Success) cities = await result.data;
    setBusy(false);
    return result;
  }
}
