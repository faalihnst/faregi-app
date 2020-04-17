import 'todo.dart';

class Trip {
  String place;
  String image;
  String duration;
  String price;
  String dateTo;
  String dateFrom;
  String cityFrom;
  String cityTo;
  List<ItenaryId> itenaryIds;

  Trip({
    this.place,
    this.image,
    this.duration,
    this.price,
    this.itenaryIds,
    this.dateFrom,
    this.dateTo,
    this.cityFrom,
    this.cityTo,
  });

  factory Trip.fromJson(Map<String, dynamic> json) {
    var list = json['itenerary_ids'] as List;
    List<ItenaryId> data = list.map((i) => ItenaryId.fromJson(i)).toList();
    return Trip(
      place: json["name"],
      duration: json["duration"],
      dateFrom: json["date_from"],
      dateTo: json["date_to"],
      cityFrom: json["city_from"],
      cityTo: json["city_to"],
      price: json["price"],
      itenaryIds: data,
    );
  }
}

class ItenaryId {
  String name;
  String date;
  double duration;
  String hour;
  ToDo todo;

  ItenaryId({this.duration, this.name, this.date, this.hour, this.todo});

  factory ItenaryId.fromJson(Map<String, dynamic> json) => ItenaryId(
        name: json["name"],
        date: json["date"],
        duration: json["duration"],
        hour: json["hour"],
//      todo: ToDo.fromJson(json["todo"])
      );
}
