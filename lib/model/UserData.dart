class UserData {
  String? name;
  String? email;

  UserData({this.name, this.email});

  UserData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = name;
    data['email'] = email;
    return data;
  }
}
