// To parse this JSON data, do
//
//     final courseModel = courseModelFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/cupertino.dart';

CourseModel courseModelFromJson(String str) => CourseModel.fromJson(json.decode(str));

String courseModelToJson(CourseModel data) => json.encode(data.toJson());

class CourseModel {
    int id;
    String name;
    String description;
    String color;
    String imagePath;
    int enrollTyId;
    int teacherId;
    double price;
    Text requirements;
    Text leam;
    int carreraId;

    CourseModel({
        this.id,
        this.name,
        this.description,
        this.color,
        this.imagePath,
        this.enrollTyId,
        this.teacherId,
        this.price,
        this.requirements,
        this.leam,
        this.carreraId,
    });

    factory CourseModel.fromJson(Map<String, dynamic> json) => CourseModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        color: json["color"],
        imagePath: json["image_path"],
        enrollTyId: json["enroll_ty_id"],
        teacherId: json["teacher_id"],
        price: json["price"].toDouble(),
        requirements: json["requirements"],
        leam: json["leam"],
        carreraId: json["carrera_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "color": color,
        "image_path": imagePath,
        "enroll_ty_id": enrollTyId,
        "teacher_id": teacherId,
        "price": price,
        "requirements": requirements,
        "leam": leam,
        "carrera_id": carreraId,
    };
}
