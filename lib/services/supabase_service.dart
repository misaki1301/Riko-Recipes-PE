import "package:supabase_flutter/supabase_flutter.dart";

final supabase = Supabase.instance.client;

class SupabaseService {
  Future<List<Map<String, dynamic>>> getRecipes() async {
    try {
      final future =
          await supabase.from("recipes").select<List<Map<String, dynamic>>>();
      //final data = await supabase.from("recipes").select().single();
      //print("data $data");
      print("future $future");
      return future;
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }
}
