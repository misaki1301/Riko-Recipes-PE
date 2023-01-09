class RecipeCategory {
  int? id;
  String? name;
  String? iconName;
  DateTime? createdAt;
  bool? isActive;

  RecipeCategory(
      {this.id, this.name, this.iconName, this.createdAt, this.isActive});

  factory RecipeCategory.fromJson(Map<String, dynamic> json) => RecipeCategory(
      id: json["id"],
      name: json["name"],
      iconName: json["icon_name"],
      createdAt: DateTime.parse(json["created_at"]),
      isActive: json["is_active"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "icon_name": iconName,
        "created_at": createdAt?.toIso8601String(),
        "is_active": isActive
      };
}
