import 'dart:convert';

Recipe? recipeFromJson(String str) => Recipe.fromJson(json.decode(str));
String recipeToJson(Recipe? data) => json.encode(data!.toJson());

class Recipe {
  int? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? name;
  String? maxTime;
  String? image;
  int? dishStyle;
  int? rating;
  int? calories;
  String? level;
  String? authorName;
  String? authorImage;
  bool? isActive;

  Recipe(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.name,
      this.maxTime,
      this.image,
      this.dishStyle,
      this.rating,
      this.calories,
      this.level,
      this.authorName,
      this.authorImage,
      this.isActive});

  factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
      id: json["id"],
      createdAt: DateTime.parse(json["createdAt"]),
      updatedAt: DateTime.parse(json["updatedAt"]),
      name: json["name"],
      maxTime: json["maxTime"],
      image: json["image"],
      dishStyle: json["dishStyle"],
      rating: json["rating"],
      calories: json["calories"],
      level: json["level"],
      authorName: json["authorName"],
      authorImage: json["authorImage"],
      isActive: json["isActive"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "name": name,
        "maxTime": maxTime,
        "image": image,
        "dishStyle": dishStyle,
        "rating": rating,
        "calories": calories,
        "level": level,
        "authorName": authorName,
        "authorImage": authorImage,
        "isActive": isActive,
      };
}
