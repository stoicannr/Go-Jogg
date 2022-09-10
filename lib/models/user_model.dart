class User {
  final String uid;
  final String location;
  final String sex;
  final String distance;
  final String age;
  final String image;
  final String name;
  final String uploadedImage;
  final String location1, location2, location3;
  final String? incognitoMode;
  final String? darkMode;
  final String lat;
  final String long;

  User({
    required this.uid,
    required this.location,
    required this.sex,
    required this.distance,
    required this.age,
    required this.image,
    required this.name,
    required this.uploadedImage,
    required this.location1,
    required this.location2,
    required this.location3,
    required this.lat,
    required this.long,
    this.incognitoMode,
    this.darkMode,
  });

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'location': location,
        'sex': sex,
        'distance': distance,
        'age': age,
        'image': image,
        'name': name,
        'uploadedImage': uploadedImage,
        'location1': location1,
        'location2': location2,
        'location3': location3,
        'incognitoMode': incognitoMode,
        'darkMode': darkMode,
        'lat': lat,
        'long': long
      };

  static User fromJson(Map<String, dynamic> json) {
    return User(
        uid: json['uid'].toString(),
        location: json['location'].toString(),
        sex: json['sex'].toString(),
        distance: json['distance'].toString(),
        age: json['age'].toString(),
        image: json['image'].toString(),
        name: json['name'].toString(),
        uploadedImage: json['uploadedImage'].toString(),
        location1: json['location1'].toString(),
        location2: json['location2'].toString(),
        location3: json['location3'].toString(),
        incognitoMode: json['incognitoMode'].toString(),
        darkMode: json['darkMode'].toString(),
        lat: json['lat'].toString(),
        long: json['long'].toString());
  }
}
