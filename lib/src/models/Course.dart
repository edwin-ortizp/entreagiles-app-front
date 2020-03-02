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

    //wliminar
  String university;
  String noOfCource;
  String tag1;
  String tag2;



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

        //eliminar
        this.noOfCource,
        this.university,
        this.tag1,
        this.tag2
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
class CourseList {
  static List<CourseModel> list = [
    CourseModel(
        name: "Data Science",
        description:
            "Launch your career in data science. A sweet-cource introduction to data science, develop and taught by leading professors.",
        university: "Jons Hopkins University",
        noOfCource: "17 courses",
        tag1: "Data science",
        tag2: "Machine Learning"),
    CourseModel(
        name: "Machine Learning",
        description:
            "This specialization from leading researchers at university of washington introduce to you to the exciting high-demand field of machine learning ",
        university: "University of washington",
        noOfCource: "8 courses",
        tag1: "Machine Learning",
        tag2: "Decision Tree"),
    CourseModel(
        name: "Big Data",
        description:
            "Drive better bussiness decision with an overview OF how big data is organised  and intepreted. Apply insight to real-world problems and question",
        university: "Us San Diego",
        noOfCource: "10 courses",
        tag1: "Data Data",
        tag2: "Apache Spark"),
  ];
}

