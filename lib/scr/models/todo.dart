

class ToDo {
  String name;
  String images;
  String description;
  String ticketPrice;

  ToDo({
    this.name,
    this.images,
    this.description,
    this.ticketPrice,
  });

  factory ToDo.fromJson(Map<String, dynamic> json) => ToDo(
        name: json["name"],
        description: json["description"],
        ticketPrice: json["price"],
        images: json["image"] != null ? json["image"] : " ",
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "price": ticketPrice,
      };
}
