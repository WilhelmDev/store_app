import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    final int id;
    final String email;
    final String name;
    final String lastName;
    final int roleId;
    final int storeId;
    final dynamic avatar;
    final String token;

    User({
        required this.id,
        required this.email,
        required this.name,
        required this.lastName,
        required this.roleId,
        required this.storeId,
        required this.avatar,
        required this.token,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
        name: json["name"],
        lastName: json["lastName"],
        roleId: json["roleId"],
        storeId: json["storeId"],
        avatar: json["avatar"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "name": name,
        "lastName": lastName,
        "roleId": roleId,
        "storeId": storeId,
        "avatar": avatar,
        "token": token,
    };
}