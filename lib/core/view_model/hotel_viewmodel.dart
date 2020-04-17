import 'package:faregi_app/core/locator.dart';
import 'package:faregi_app/core/result.dart';
import 'package:faregi_app/core/view_model/base_viewmodel.dart';
import 'package:faregi_app/core/services/api.dart';
import 'package:faregi_app/scr/models/cars.dart';
import 'package:faregi_app/scr/models/hotels.dart';
import 'package:faregi_app/scr/models/trains.dart';

class HotelModel extends BaseModel {
  Api _api = locator<Api>();
  List<Hotel> hotels = List<Hotel>();
  String errorMessage;
  String location;

  void init() async {
    setBusy(true);
    errorMessage = '';
    setBusy(false);
  }

  Future getHotel() async {
    setBusy(true);
    Result result = await _api.hotel(location);
    if (result.resultType == ResultType.Success) hotels = await result.data;
    setBusy(false);
    return result;
  }
}
