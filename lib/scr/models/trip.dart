import 'todo.dart';

class Trip {
  int id;
  String place;
  String image;
  String duration;
  String price;
  String dateTo;
  String dateFrom;
  String cityFrom;
  String cityTo;
  List<ItenaryId> itenaryIds;

  Trip(
      {this.place,
      this.image,
      this.duration,
      this.price,
      this.itenaryIds,
      this.dateFrom,
      this.dateTo,
      this.cityFrom,
      this.cityTo,
      this.id});

  factory Trip.fromJson(Map<String, dynamic> json) {
    var list = json['itenerary_ids'] as List;
    List<ItenaryId> data = list.map((i) => ItenaryId.fromJson(i)).toList();
    return Trip(
      id: json["id"],
      place: json["name"],
      duration: json["duration"],
      dateFrom: json["date_from"],
      dateTo: json["date_to"],
      cityFrom: json["city_from"],
      cityTo: json["city_to"],
      price: json["price"],
      image: json["image"] != null ? json["image"] : " ",
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
        todo: json["todo_id"] != null ? ToDo.fromJson(json["todo_id"]) : null,
      );
}
