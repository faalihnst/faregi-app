import 'package:faregi_app/core/locator.dart';
import 'package:faregi_app/core/result.dart';
import 'package:faregi_app/core/view_model/base_viewmodel.dart';
import 'package:faregi_app/core/services/api.dart';
import 'package:faregi_app/scr/models/trains.dart';

class TrainModel extends BaseModel {
  Api _api = locator<Api>();
  List<Train> trains = List<Train>();
  String errorMessage;
  String from;
  String to;
  String departureDate;
  String returnDate;

  void init() async {
    setBusy(true);
    errorMessage = '';
    setBusy(false);
  }

  Future getTrain() async {
    setBusy(true);
    Result result =
    await _api.train(from, to, departureDate, returnDate);
    if (result.resultType == ResultType.Success) trains = await result.data;
    setBusy(false);
    return result;
  }
}
