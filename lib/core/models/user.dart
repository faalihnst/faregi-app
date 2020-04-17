class User {
  String sessionId;
  String name;
  String username;

  User({
    this.sessionId,
    this.name,
    this.username,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        sessionId: json["session_id"],
        name: json["name"],
        username: json["username"],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["session_id"] = this.sessionId;
    data["name"] = this.name;
    data["username"] = this.username;
    return data;
  }
}

class Cookie {
  String sessionId;
  Cookie({this.sessionId});
}