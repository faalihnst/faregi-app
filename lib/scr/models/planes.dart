class Plane {
  String plane;
  String flightCode;
  String fromAirport;
  String toAirport;
  String fromTime;
  String toTime;
  String image;
  String price;
  String classType;

  Plane({
    this.plane,
    this.flightCode,
    this.fromAirport,
    this.toAirport,
    this.fromTime,
    this.toTime,
    this.image,
    this.price,
    this.classType,
  });

  factory Plane.fromJson(Map<String, dynamic> json) => Plane(
      classType: json["class_type"],
      fromAirport: json["departure_city"],
      toAirport: json["arrival_city"],
      flightCode: json["code"],
      fromTime: json["departure_datetime"],
      toTime: json["arrival_datetime"],
      price: json["price"],
      plane: json["airline_id"]["name"],
      image: json["airline_id"]["logo"] != null ? json["airline_id"]["logo"] : " " );

  Map<String, dynamic> toJson() => {
        "class_type": classType,
        "departure_city": fromAirport,
        "arrival_city": toAirport,
        "code": flightCode,
        "departure_datetime": fromTime,
        "arrival_datetime": toTime,
      };
}
