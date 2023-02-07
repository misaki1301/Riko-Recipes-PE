class RecipeCategory {
  int? id;
  String? name;
  String? iconName;
  DateTime? createdAt;
  DateTime? updatedAt;
  bool? isActive;

  RecipeCategory(
      {this.id, this.name, this.iconName, this.createdAt, this.updatedAt, this.isActive});

  factory RecipeCategory.fromJson(Map<String, dynamic> json) => RecipeCategory(
      id: json["id"],
      name: json["name"],
      iconName: json["iconName"],
      createdAt: DateTime.parse(json["createdAt"]),
      updatedAt: DateTime.parse(json["updatedAt"]),
      isActive: json["isActive"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "iconName": iconName,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "isActive": isActive
      };
}
