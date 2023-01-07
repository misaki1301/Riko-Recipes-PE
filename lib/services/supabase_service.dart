import "package:supabase_flutter/supabase_flutter.dart";

final supabase = Supabase.instance.client;

class SupabaseService {
  Future<List<Map<String, dynamic>>> getRecipes() async {
    final future =
        await supabase.from("recipes").select<List<Map<String, dynamic>>>();
    print("future $future");
    return future;
  }
}
