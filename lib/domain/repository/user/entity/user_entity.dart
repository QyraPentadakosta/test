class UserEntity {
  int? id;
  String userName;
  String email;
  String password;

  UserEntity({
    this.id,
    required this.userName,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'email': email,
      'password': password,
    };
  }

  factory UserEntity.fromMap(Map<String, dynamic> map) {
    return UserEntity(
      id: map['id'],
      userName: map['userName'],
      email: map['email'],
      password: map['password'],
    );
  }
}
