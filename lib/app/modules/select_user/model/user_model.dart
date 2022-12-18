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

final UserModel cavin = UserModel(
  id: "1",
  name: "Cavin",
  photoURL: "https://avatars.githubusercontent.com/u/50316190?v=4",
);
final UserModel appu = UserModel(
  id: "2",
  name: "Appu",
  photoURL: "https://cdn-icons-png.flaticon.com/512/149/149071.png",
);
final UserModel milan = UserModel(
  id: "3",
  name: "Milan",
  photoURL:
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQyD3SI8Qdekp6twYtnVVcpKfHw7WVQGy9Yfd32EiXPZI30cEgXJ-XhquB0ObTnutlwQrM&usqp=CAU",
);

final List<UserModel> userList = [cavin, appu, milan];
