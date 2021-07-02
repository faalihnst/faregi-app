import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:faregi_app/core/models/user.dart';
import 'package:faregi_app/core/services/auth_service.dart';
import 'package:faregi_app/scr/models/cars.dart';
import 'package:faregi_app/scr/models/city.dart';
import 'package:faregi_app/scr/models/hotels.dart';
import 'package:faregi_app/scr/models/planes.dart';
import 'package:faregi_app/core/result.dart';
import 'package:faregi_app/core/locators.dart';
import 'package:faregi_app/scr/models/todo.dart';
import 'package:faregi_app/scr/models/trains.dart';
import 'package:faregi_app/scr/models/trip.dart';

class Api {
  static String baseUrlDev = 'http://172.105.122.75:8069';
  AuthService _auth = locator<AuthService>();
  static BaseOptions _baseOptions = BaseOptions(
    baseUrl: baseUrlDev,
    contentType: 'application/json',
    receiveTimeout: 5,
  );
  Dio dio = Dio(_baseOptions);

  Map<String, String> headers = {"Content-Type": "application/json"};

  Future login(String username, String password) async {
    var data = jsonEncode({
      "login": username,
      "password": password,
    });
    try {
      Response response = await dio.post(
        '/api/v1/login',
        data: data,
      );
      print(response.headers);
      User user = User.fromJson(response.data['data']);
      print("username = ${user.username}");
      _auth.freshLogin(user);
      _auth.updateCookie(response.headers);
      print(response.statusCode);
      print(user.username);
      return Result(ResultType.Success, 'Login berhasil');
    } catch (e) {
      print('$e');
      return Result(ResultType.Error, 'Username atau password salah');
    }
  }

  Future register(String username, String password, String name,
      String confirmPassword) async {
    var data = jsonEncode({
      "login": username,
      "name": name,
      "password": password,
      "confirm_password": confirmPassword,
    });

    try {
      Response response = await dio.post(
        '/api/v1/signup',
        data: data,
      );
      print(response.headers);
      User user = User.fromJson(response.data['data']);
      _auth.freshLogin(user);
      _auth.updateCookie(response.headers);
      print(_auth.sessionId);
      print(response.statusCode);
      return Result(ResultType.Success, 'SignUp berhasil');
    } catch (e) {
      print('$e');
      return Result(ResultType.Error, 'SignUp Gagal');
    }
  }

  Future plane(String from, String to, String departureDate, String returnDate,
      String number) async {
    String sessionId = await _auth.sessionId;
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Cookie': sessionId
    };
    var data = jsonEncode({
      "city_from": from,
      "city_to": to,
      "date_from": departureDate,
      "date_to": returnDate,
      "number": number
    });

    List<Plane> planes = List<Plane>();

    try {
      http.Response response = await http.post(
        'http://172.105.122.75:8069/api/flights/search',
        body: data,
        headers: headers,
      );
      print(sessionId);
      final body = jsonDecode(response.body)['data']['records'];
      print('response body:\n$body');
      var planeList = body;
      // add to products
      for (var plane in planeList) {
        planes.add(Plane.fromJson(plane));
      }
      print('Catalog fetched successfully: status code ${response.statusCode}');
      return Result<List<Plane>>(ResultType.Success, 'Katalog berhasil dimuat',
          data: planes);
    } catch (e) {
      print('$e');
      return Result(ResultType.Error, 'Data Tidak Tersedia');
    }
  }

  Future train(
      String from, String to, String departureDate, String returnDate) async {
    String sessionId = await _auth.sessionId;
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Cookie': sessionId
    };
    var data = jsonEncode({
      "city_from": from,
      "city_to": to,
      "date_from": departureDate,
      "date_to": returnDate,
    });

    List<Train> trains = List<Train>();

    try {
      http.Response response = await http.post(
        'http://172.105.122.75:8069/api/trains/search',
        body: data,
        headers: headers,
      );
      print(sessionId);
      final body = jsonDecode(response.body)['data']['records'];
      print('response body:\n$body');
      var trainList = body;
      // add to products
      for (var train in trainList) {
        trains.add(Train.fromJson(train));
      }
      print('Catalog fetched successfully: status code ${response.statusCode}');
      return Result<List<Train>>(ResultType.Success, 'Katalog berhasil dimuat',
          data: trains);
    } catch (e) {
      print('$e');
      return Result(ResultType.Error, 'Data Tidak Tersedia');
    }
  }

  Future car(String location) async {
    String sessionId = await _auth.sessionId;
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Cookie': sessionId
    };
    var data = jsonEncode({
      "location": location,
    });

    List<Car> cars = List<Car>();

    try {
      http.Response response = await http.post(
        'http://172.105.122.75:8069/api/cars/search',
        body: data,
        headers: headers,
      );
      print(sessionId);
      final body = jsonDecode(response.body)['data']['records'];
      print('response body:\n$body');
      var carList = body;
      // add to products
      for (var car in carList) {
        cars.add(Car.fromJson(car));
      }
      print('Catalog fetched successfully: status code ${response.statusCode}');
      return Result<List<Car>>(ResultType.Success, 'Katalog berhasil dimuat',
          data: cars);
    } catch (e) {
      print('$e');
      return Result(ResultType.Error, 'Data Tidak Tersedia');
    }
  }

  Future hotel(String location) async {
    String sessionId = await _auth.sessionId;
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Cookie': sessionId
    };
    var data = jsonEncode({
      "location": location,
    });

    List<Hotel> hotels = List<Hotel>();

    try {
      http.Response response = await http.post(
        'http://172.105.122.75:8069/api/hotels/search',
        body: data,
        headers: headers,
      );
      print(sessionId);
      final body = jsonDecode(response.body)['data']['records'];
      print('response body:\n$body');
      var hotelList = body;
      // add to products
      for (var hotel in hotelList) {
        hotels.add(Hotel.fromJson(hotel));
      }
      print('Catalog fetched successfully: status code ${response.statusCode}');
      return Result<List<Hotel>>(ResultType.Success, 'Katalog berhasil dimuat',
          data: hotels);
    } catch (e) {
      print('$e');
      return Result(ResultType.Error, 'Data Tidak Tersedia');
    }
  }

  Future todo() async {
    String sessionId = await _auth.sessionId;
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Cookie': sessionId
    };
    var data = jsonEncode({});

    List<ToDo> todos = List<ToDo>();

    try {
      http.Response response = await http.post(
        'http://172.105.122.75:8069/api/todos/all',
        body: data,
        headers: headers,
      );
      print(sessionId);
      final body = jsonDecode(response.body)['data']['records'];
      print('response body:\n$body');
      var todoList = body;
      // add to products
      for (var todo in todoList) {
        todos.add(ToDo.fromJson(todo));
      }
      print('Catalog fetched successfully: status code ${response.statusCode}');
      return Result<List<ToDo>>(ResultType.Success, 'Katalog berhasil dimuat',
          data: todos);
    } catch (e) {
      print('$e');
      return Result(ResultType.Error, 'Data Tidak Tersedia');
    }
  }

  Future explore() async {
    String sessionId = await _auth.sessionId;
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Cookie': sessionId
    };
    var data = jsonEncode({});

    List<City> cities = List<City>();

    try {
      http.Response response = await http.post(
        'http://172.105.122.75:8069/api/explores/all',
        body: data,
        headers: headers,
      );
      print(sessionId);
      final body = jsonDecode(response.body)['data']['records'];
      print('response body:\n$body');
      var cityList = body;
      // add to products
      for (var city in cityList) {
        cities.add(City.fromJson(city));
      }
      print('Catalog fetched successfully: status code ${response.statusCode}');
      return Result<List<City>>(ResultType.Success, 'Katalog berhasil dimuat',
          data: cities);
    } catch (e) {
      print('$e');
      return Result(ResultType.Error, 'Data Tidak Tersedia');
    }
  }

  Future planner(int budgetMin, int budgetMax, String transport,
      String cityFrom, String cityTo, String dateFrom, String dateTo) async {
    String sessionId = await _auth.sessionId;
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Cookie': sessionId
    };
    var data = jsonEncode({
      "budget_min": budgetMin,
      "budget_max": budgetMax,
      "transport": transport,
      "city_from": cityFrom,
      "city_to": cityTo,
      "date_from": dateFrom,
      "date_to": dateTo
    });

    try {
      http.Response response = await http.post(
        'http://172.105.122.75:8069/api/trips/search',
        body: data,
        headers: headers,
      );
      print(sessionId);
      final body = jsonDecode(response.body)['data'];
      print('response body:\n$body');
      Trip trip = Trip.fromJson(body['records'][0]);
      print('Catalog fetched successfully: status code ${response.statusCode}');
      return Result<Trip>(ResultType.Success, 'Trip Berhasil dibuat',
          data: trip);
    } catch (e) {
      print('$e');
      return Result(ResultType.Error, 'Data Tidak Tersedia');
    }
  }

  Future package() async {
    String sessionId = await _auth.sessionId;
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Cookie': sessionId
    };
    var data = jsonEncode({});

    List<Trip> trips = List<Trip>();

    try {
      http.Response response = await http.post(
        'http://172.105.122.75:8069/api/trips/all',
        body: data,
        headers: headers,
      );
      print(sessionId);
      final body = jsonDecode(response.body)['data']['records'];
      print('response body:\n$body');
      var tripList = body;
      // add to products
      for (var trip in tripList) {
        trips.add(Trip.fromJson(trip));
      }
      print('Catalog fetched successfully: status code ${response.statusCode}');
      return Result<List<Trip>>(ResultType.Success, 'Katalog berhasil dimuat',
          data: trips);
    } catch (e) {
      print('$e');
      return Result(ResultType.Error, 'Data Tidak Tersedia');
    }
  }

  Future book(int id) async {
    String sessionId = await _auth.sessionId;
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Cookie': sessionId
    };
    var data = jsonEncode({
      "id": id,
    });

    try {
      http.Response response = await http.post(
        'http://172.105.122.75:8069/api/hotels/search',
        body: data,
        headers: headers,
      );
      print(response.statusCode);
      return Result(ResultType.Success,
          'Data Berhasil Disimpan, Lihat di Bookmarks Anda');
    } catch (e) {
      print('$e');
      return Result(ResultType.Error, 'Data Gagal Disimpan');
    }
  }
}
