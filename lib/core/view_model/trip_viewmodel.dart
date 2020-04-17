import 'package:faregi_app/core/locator.dart';
import 'package:faregi_app/core/result.dart';
import 'package:faregi_app/core/services/api.dart';
import 'package:faregi_app/core/view_model/base_viewmodel.dart';
import 'package:faregi_app/scr/models/trip.dart';


class TripModel extends BaseModel {
  Api _api = locator<Api>();
  Trip trip = Trip();
  String errorMessage;
  int budgetMin; int budgetMax; String transport;
      String cityFrom; String cityTo; String dateFrom; String dateTo;

  void init() async {
    setBusy(true);
    errorMessage = '';
    setBusy(false);
  }

  Future getTrip() async {
    setBusy(true);
    Result result = await _api.planner(budgetMin, budgetMax, transport, cityFrom, cityTo, dateFrom, dateTo);
    if (result.resultType == ResultType.Success) trip = await result.data;
    setBusy(false);
    return result;
  }
}