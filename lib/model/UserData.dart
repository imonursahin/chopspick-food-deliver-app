class UserData {
  String? name;
  String? email;
  String? password;

  UserData({this.name, this.email, this.password});

  factory UserData.fromMap(map) {
    return UserData(
      name: map['name'],
      email: map['email'],
      password: map['password'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
    };
  }
}
