class UserModel {
  UserModel({required this.name, required this.picture});
  final String name;
  final String picture;


  factory UserModel.fromJson(json){
    return UserModel(
        name: json['name']['title'] +
            ' ' +
            json['name']['first'] +
            ' ' +
            json['name']['last'],
        picture: json['picture']['large']);
  }
}
