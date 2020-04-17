import 'package:faregi_app/core/locator.dart';
import 'package:faregi_app/scr/models/planes.dart';
import 'package:faregi_app/core/result.dart';
import 'package:faregi_app/core/view_model/base_viewmodel.dart';
import 'package:faregi_app/core/services/api.dart';

class PlaneModel extends BaseModel {
  Api _api = locator<Api>();
  List<Plane> planes = List<Plane>();
  String errorMessage;
  String from;
  String to;
  String departureDate;
  String returnDate;
  String number;

  void init() async {
    setBusy(true);
    errorMessage = '';
    setBusy(false);
  }

  Future getPlane() async {
    setBusy(true);
    Result result =
        await _api.plane(from, to, departureDate, returnDate, number);
    if (result.resultType == ResultType.Success) planes = await result.data;
    setBusy(false);
    return result;
  }
}
