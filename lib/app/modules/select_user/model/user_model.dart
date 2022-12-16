class UserModel {
  UserModel({
    required this.id,
    required this.name,
    required this.photoURL,
  });
  final String id;
  final String name;
  final String photoURL;
}

final UserModel cavin = UserModel(id: "1", name: "Cavin", photoURL: "photoURL");
final UserModel appu = UserModel(id: "2", name: "Appu", photoURL: "photoURL");
final UserModel milan = UserModel(id: "3", name: "Milan", photoURL: "photoURL");

final List<UserModel> userList = [cavin, appu, milan];
