import 'package:putakerikoeh/models/recipe.dart';
import 'package:putakerikoeh/models/recipe_category.dart';
import "package:supabase_flutter/supabase_flutter.dart";

final supabase = Supabase.instance.client;

class SupabaseService {
  Future<List<Recipe>> getRecipes() async {
    try {
      List<dynamic> data = await supabase.from("recipes").select();
      List<Recipe> recipes =
          data.map((recipe) => Recipe.fromJson(recipe)).toList();
      return recipes;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Recipe> getRecipe(int id) async {
    try {
      dynamic data =
          await supabase.from("recipes").select().eq('id', id).single();
      Recipe recipe = Recipe.fromJson(data);
      print(recipe.name);
      return recipe;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<RecipeCategory>> getRecipeCategories() async {
    try {
      List<dynamic> data = await supabase.from("recipe_categories").select();
      List<RecipeCategory> categories =
          data.map((e) => RecipeCategory.fromJson(e)).toList();
      return categories;
    } catch (e) {
      throw Exception(e);
    }
  }
}
