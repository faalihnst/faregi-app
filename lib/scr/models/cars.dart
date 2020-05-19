class Car {
  String car;
  int seat;
  bool driver;
  String carType;
  String image;
  String price;
  String location;

  Car(
      {this.car,
      this.seat,
      this.carType,
      this.image,
      this.price,
      this.driver,
      this.location});

  factory Car.fromJson(Map<String, dynamic> json) => Car(
      driver: json["driver"],
      carType: json["transmission"],
      seat: json["passenger"],
      price: json["price"],
      car: json["name"],
      location: json["location"],
      image: json["image"] != null ? json["image"] : " ");

  Map<String, dynamic> toJson() => {
        "driver": driver,
        "transmission": carType,
        "passenger": seat,
        "price": price,
        "name": car,
        "location": location,
      };
}
