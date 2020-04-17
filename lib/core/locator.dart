import 'package:faregi_app/core/services/auth_service.dart';
import 'package:faregi_app/core/view_model/car_viewmodel.dart';
import 'package:faregi_app/core/view_model/city_viewmodel.dart';
import 'package:faregi_app/core/view_model/hotel_viewmodel.dart';
import 'package:faregi_app/core/view_model/package_viewmodel.dart';
import 'package:faregi_app/core/view_model/plane_viewmodel.dart';
import 'package:faregi_app/core/view_model/todo_viewmodel.dart';
import 'package:faregi_app/core/view_model/train_viewmodel.dart';
import 'package:faregi_app/core/view_model/trip_viewmodel.dart';
import 'package:faregi_app/scr/models/trip.dart';
import 'package:faregi_app/scr/screens/planner_details.dart';

import 'view_model/auth_viewmodel.dart';
import 'package:get_it/get_it.dart';
import 'services/api.dart';

GetIt locator = GetIt.asNewInstance();

void setupLocator() {
  locator
    ..registerLazySingleton(() => Api())
    ..registerFactory(() => AuthViewModel())
    ..registerLazySingleton(() => CityModel())
    ..registerLazySingleton(() => TripModel())
    ..registerLazySingleton(() => ToDoModel())
    ..registerLazySingleton(() => PlaneModel())
    ..registerLazySingleton(() => TrainModel())
    ..registerLazySingleton(() => CarModel())
    ..registerLazySingleton(() => HotelModel())
    ..registerLazySingleton(() => PackageModel())
    ..registerLazySingleton(() => AuthService());
}
