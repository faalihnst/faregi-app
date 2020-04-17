import 'todo.dart';

class City {
  String city;
  String desc;
  String image;
  List<ToDo> toDo;

  City({
    this.city,
    this.desc,
    this.image,
    this.toDo,
  });

  factory City.fromJson(Map<String, dynamic> json) {
    var list = json['todo_ids'] as List;
    List<ToDo> data = list.map((i) => ToDo.fromJson(i)).toList();
    return City(
      city: json["name"],
      desc: json["description"],
      toDo: data,
    );
  }
}
