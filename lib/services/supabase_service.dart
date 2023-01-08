import 'dart:convert';

import 'package:putakerikoeh/models/recipe.dart';
import "package:supabase_flutter/supabase_flutter.dart";

final supabase = Supabase.instance.client;

class SupabaseService {
  Future<List<Recipe>> getRecipes() async {
    try {
      List<dynamic> data = await supabase.from("recipes").select();
      List<Recipe> recipes =
          data.map((recipe) => Recipe.fromJson(recipe)).toList();
      print("future ${data.toString()}");
      return recipes;
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }
}
