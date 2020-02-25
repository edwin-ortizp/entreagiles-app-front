// To parse this JSON data, do
//
//     final usuarioModel = usuarioModelFromJson(jsonString);

import 'dart:convert';

UsuarioModel usuarioModelFromJson(String str) => UsuarioModel.fromJson(json.decode(str));

String usuarioModelToJson(UsuarioModel data) => json.encode(data.toJson());

class UsuarioModel {
    String id;
    String username;
    String firstName;
    String lastName;
    String email;
    String type;
    String password;
    String imagePath;
    String rememberToken;
    // DateTime createdAt;
    // DateTime updatedAt;
    // DateTime lastLoggedInAt;
    int enrollTypeId;
    int avatarId;
    int countryId;
    String phone;
    DateTime enrollDateTo;
    int points;

    UsuarioModel({
        this.id,
        this.username ,
        this.firstName = "",
        this.lastName = "",
        this.email,
        this.type = "student",
        this.password,
        this.imagePath = "",
        this.rememberToken = "",
        // this.createdAt,
        // this.updatedAt,
        // this.lastLoggedInAt,
        this.enrollTypeId,
        this.avatarId = 1,
        this.countryId =256,
        this.phone = "",
        this.enrollDateTo,
        this.points = 0,
    });

    factory UsuarioModel.fromJson(Map<String, dynamic> json) => UsuarioModel(
        id: json["id"],
        username: json["username"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        type: json["type"],
        password: json["password"],
        imagePath: json["image_path"],
        rememberToken: json["remember_token"],
        // createdAt: DateTime.parse(json["created_at"]),
        // updatedAt: DateTime.parse(json["updated_at"]),
        // lastLoggedInAt: DateTime.parse(json["last_logged_in_at"]),
        enrollTypeId: json["enroll_type_id"],
        avatarId: json["avatar_id"],
        countryId: json["country_id"],
        phone: json["phone"],
        enrollDateTo: DateTime.parse(json["enroll_date_to"]),
        points: json["points"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "type": type,
        "password": password,
        "image_path": imagePath,
        "remember_token": rememberToken,
        // "created_at": createdAt.toIso8601String(),
        // "updated_at": updatedAt.toIso8601String(),
        // "last_logged_in_at": lastLoggedInAt.toIso8601String(),
        "enroll_type_id": enrollTypeId,
        "avatar_id": avatarId,
        "country_id": countryId,
        "phone": phone,
        "enroll_date_to": enrollDateTo.toIso8601String(),
        "points": points,
    };
}
