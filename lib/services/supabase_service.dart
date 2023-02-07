import 'dart:convert';
import 'dart:io';

import '/models/recipe.dart';
import '/models/recipe_category.dart';
import "package:supabase_flutter/supabase_flutter.dart";
import "package:http/http.dart" as http;

final supabase = Supabase.instance.client;
const baseUrl = "http://192.168.1.8:8080";

class SupabaseService {
  Future<List<Recipe>> getRecipes() async {
    try {
      final response = await http.get(Uri.parse("$baseUrl/recipes"));
      if (response.statusCode == 200) {
        print(response.body);
        List<dynamic> data = json.decode(response.body);
        return data.map((recipe) => Recipe.fromJson(recipe)).toList();
      } else {
        return [];
      }
    } catch (e) {
      throw Exception(e);
    }
  }


    Future<Recipe> getRecipe(int id) async {
      try {
        final response =
        await http.get(Uri.parse("$baseUrl/recipes/$id"));
        if (response.statusCode == 200) {
          Recipe recipe = Recipe.fromJson(json.decode(response.body));
          return recipe;
        } else {
          throw const HttpException("Not found");
        }
      } catch (e) {
        throw Exception(e);
      }
    }

    Future<List<RecipeCategory>> getRecipeCategories() async {
      try {
        final response = await http.get(Uri.parse("$baseUrl/recipes/categories"));
        //List<dynamic> data = await supabase.from("recipe_categories").select();
        //List<RecipeCategory> categories =
        //data.map((e) => RecipeCategory.fromJson(e)).toList();
        if (response.statusCode == 200) {
          List<dynamic> data = json.decode(response.body);
          return data.map((e) => RecipeCategory.fromJson(e)).toList();
        } else {
          return [];
        }
      } catch (e) {
        throw Exception(e);
      }
    }
}
