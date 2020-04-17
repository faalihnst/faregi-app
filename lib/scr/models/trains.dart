class Train {
  String train;
  String trainCode;
  String fromStation;
  String toStation;
  String fromTime;
  String toTime;
  String image;
  String price;
  String classType;

  Train(
      {this.train,
      this.trainCode,
      this.fromStation,
      this.toStation,
      this.fromTime,
      this.toTime,
      this.image,
      this.price,
      this.classType});

  factory Train.fromJson(Map<String, dynamic> json) => Train(
      classType: json["class_type"],
      fromStation: json["departure_city"],
      toStation: json["arrival_city"],
      trainCode: json["code"],
      fromTime: json["departure_datetime"],
      toTime: json["arrival_datetime"],
      price: json["price"],
      train: json["train"]);

  Map<String, dynamic> toJson() => {
        "class_type": classType,
        "departure_city": fromStation,
        "arrival_city": toStation,
        "code": trainCode,
        "departure_datetime": fromTime,
        "arrival_datetime": toTime,
        "price": price,
        "train": train
      };
}
