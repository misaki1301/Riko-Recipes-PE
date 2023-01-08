import 'dart:convert';

Recipe? recipeFromJson(String str) => Recipe.fromJson(json.decode(str));
String recipeToJson(Recipe? data) => json.encode(data!.toJson());

class Recipe {
  int? id;
  DateTime? createdAt;
  String? name;
  int? maxTime;
  String? image;
  int? dishStyle;
  double? rating;
  int? calories;
  String? level;
  String? authorName;
  String? authorImage;
  bool? isActive;

  Recipe(
      {this.id,
      this.createdAt,
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
      createdAt: DateTime.parse(json["created_at"]),
      name: json["name"],
      maxTime: json["max_time"],
      image: json["image"],
      dishStyle: json["dish_style"],
      rating: json["rating"],
      calories: json["calories"],
      level: json["level"],
      authorName: json["author_name"],
      authorImage: json["author_image"],
      isActive: json["is_active"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt?.toIso8601String(),
        "name": name,
        "max_time": maxTime,
        "image": image,
        "dish_style": dishStyle,
        "rating": rating,
        "calories": calories,
        "level": level,
        "author_name": authorName,
        "author_image": authorImage,
        "is_active": isActive,
      };
}
