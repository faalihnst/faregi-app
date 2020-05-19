class Hotel {
  String hotel;
  int rating;
  String checkIn;
  String checkOut;
  String image;
  String description;
  String price;
  String location;

  Hotel(
      {this.hotel,
      this.rating,
      this.checkIn,
      this.image,
      this.checkOut,
      this.price,
      this.description,
      this.location});

  factory Hotel.fromJson(Map<String, dynamic> json) => Hotel(
      hotel: json["name"],
      description: json["description"],
      price: json["price"],
      rating: json["rating"],
      location: json["location"],
      image: json["image_ids"][0] != null ? json["image_ids"][0] : " ");

  Map<String, dynamic> toJson() => {
        "name": hotel,
        "description": description,
        "rating": rating,
        "price": price,
        "location": location,
      };
}
