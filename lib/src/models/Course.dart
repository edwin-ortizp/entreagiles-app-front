// To parse this JSON data, do
//
//     final courseModel = courseModelFromJson(jsonString);

import 'dart:convert';

CourseModel courseModelFromJson(String str) => CourseModel.fromJson(json.decode(str));

String courseModelToJson(CourseModel data) => json.encode(data.toJson());

class CourseModel {
    int id;
    String name;
    String description;
    String color;
    String imagePath;
    DateTime createdAt;
    DateTime updatedAt;
    int enrollTypeId;
    dynamic teacherId;
    int price;
    dynamic requirements;
    dynamic learn;
    dynamic top;
    dynamic carreraId;
    List<Section> sections;
    List<MySection> mySections;
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
        this.createdAt,
        this.updatedAt,
        this.enrollTypeId,
        this.teacherId,
        this.price,
        this.requirements,
        this.learn,
        this.top,
        this.carreraId,
        this.sections,
        this.mySections,
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
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        enrollTypeId: json["enroll_type_id"],
        teacherId: json["teacher_id"],
        price: json["price"],
        requirements: json["requirements"],
        learn: json["learn"],
        top: json["top"],
        carreraId: json["carrera_id"],
        sections: json["sections"] != null ? new List<Section>.from(json["sections"].map((x) => Section.fromJson(x))) : List<Section>(),
        mySections: json["mySections"] != null ? new List<MySection>.from(json["mySections"].map((x) => MySection.fromJson(x))):List<MySection>(),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "color": color,
        "image_path": imagePath,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "enroll_type_id": enrollTypeId,
        "teacher_id": teacherId,
        "price": price,
        "requirements": requirements,
        "learn": learn,
        "top": top,
        "carrera_id": carreraId,
        "sections": List<dynamic>.from(sections.map((x) => x.toJson())),
        "mySections": List<dynamic>.from(mySections.map((x) => x.toJson())),
    };
}

class MySection {
    int idCourse;
    int countSection;

    MySection({
        this.idCourse,
        this.countSection,
    });

    factory MySection.fromJson(Map<String, dynamic> json) => MySection(
        idCourse: json["idCourse"],
        countSection: json["countSection"],
    );

    Map<String, dynamic> toJson() => {
        "idCourse": idCourse,
        "countSection": countSection,
    };
}

class Section {
    int id;
    String name;
    String description;
    int courseId;
    int order;
     List<Article> articles;
    List<Quiz> quizzes;

    Section({
        this.id,
        this.name,
        this.description,
        this.courseId,
        this.order,
        this.articles,
        this.quizzes,
    });

    factory Section.fromJson(Map<String, dynamic> json) => Section(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        courseId: json["course_id"],
        order: json["order"],
        articles:["articles"] != null ? List<Article>.from(json["articles"].map((x) => Article.fromJson(x))) :List<Article>(),
        quizzes:["quizzes"] != null ? new List<Quiz>.from(json["quizzes"].map((x) => Quiz.fromJson(x))) : List<Quiz>(),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "course_id": courseId,
        "order": order,
        "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
        "quizzes": List<dynamic>.from(quizzes.map((x) => x.toJson())) ,
    };
}

class Article {
    int id;
    String name;
    String content;
    dynamic video;
    dynamic menu;
    int userId;
    int sectionId;

    Article({
        this.id,
        this.name,
        this.content,
        this.video,
        this.menu,
        this.userId,
        this.sectionId,
    });

    factory Article.fromJson(Map<String, dynamic> json) => Article(
        id: json["id"],
        name: json["name"],
        content: json["content"],
        video: json["video"],
        menu: json["menu"],
        userId: json["user_id"],
        sectionId: json["section_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "content": content,
        "video": video,
        "menu": menu,
        "user_id": userId,
        "section_id": sectionId,
    };
}


class Quiz {
    int id;
    String title;
    int score;
    int creator;
    int bankId;
    int limitTries;
    int duration;

    Quiz({
        this.id,
        this.title,
        this.score,
        this.creator,
        this.bankId,
        this.limitTries,
        this.duration,
    });

    factory Quiz.fromJson(Map<String, dynamic> json) => Quiz(
        id: json["id"],
        title: json["title"],
        score: json["score"],
        creator: json["creator"],
        bankId: json["bank_id"],
        limitTries: json["limit_tries"],
        duration: json["duration"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "score": score,
        "creator": creator,
        "bank_id": bankId,
        "limit_tries": limitTries,
        "duration": duration,
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
