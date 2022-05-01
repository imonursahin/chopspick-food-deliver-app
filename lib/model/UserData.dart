class UserData {
  String? name;
  String? email;

  UserData({this.name, this.email});

  factory UserData.fromMap(map) {
    return UserData(
      name: map['name'],
      email: map['email'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
    };
  }
}
