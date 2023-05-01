class ProfileEntity {
  int? id;
  int idUser;
  String userName;
  String gender;
  String image;
  String birthDate;
  String horoscope;
  String zodiac;
  String height;
  String weight;
  String age;

  ProfileEntity({
    this.id,
    required this.userName,
    required this.gender,
    required this.idUser,
    required this.image,
    required this.birthDate,
    required this.horoscope,
    required this.zodiac,
    required this.height,
    required this.weight,
    required this.age,
  });

  Map<String, dynamic> toMap() {
    return {
      'idUser': idUser,
      'userName': userName,
      'gender': gender,
      'image': image,
      'birthDate': birthDate,
      'horoscope': horoscope,
      'zodiac': zodiac,
      'height': height.toString(),
      'weight': weight.toString(),
      'age': age.toString(),
    };
  }

  factory ProfileEntity.fromMap(Map<String, dynamic> map) {
    return ProfileEntity(
      id: map['id'],
      idUser: map['idUser'],
      userName: map['userName'],
      gender: map['gender'],
      image: map['image'],
      birthDate: map['birthDate'],
      horoscope: map['horoscope'],
      zodiac: map['zodiac'],
      height: map['height'],
      weight: map['weight'],
      age: map['age'],
    );
  }
}
