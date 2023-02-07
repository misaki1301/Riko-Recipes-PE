import 'package:flutter/material.dart';
import 'package:sliding_up_panel2/sliding_up_panel2.dart';

import '../components/recipe_detail/feature_recipe.dart';
import '../components/recipe_detail/ingredient_item.dart';
import '../models/recipe.dart';
import '../services/supabase_service.dart';

class RecipeDetailPage extends StatelessWidget {
  const RecipeDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final recipeId = ModalRoute.of(context)!.settings.arguments as int;
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
            future: SupabaseService().getRecipe(recipeId),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              Recipe recipe = snapshot.data!;
              return SlidingUpPanel(
                parallaxEnabled: true,
                minHeight: 350,
                borderRadius: BorderRadius.circular(32),
                panelBuilder: () => Container(
                  padding: const EdgeInsets.only(top: 32, left: 16, right: 16),
                  width: screenSize.width,
                  height: 500,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      color: Colors.white),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 250,
                                child: Text(
                                  "${recipe.name}",
                                  style: const TextStyle(fontSize: 28),
                                ),
                              ),
                              const Text("Peruvian")
                            ],
                          ),
                          const Spacer(),
                          Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  color: Colors.amberAccent,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Row(
                                children: [
                                  const Icon(Icons.star),
                                  Text("${recipe.rating}")
                                ],
                              ))
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Wrap(
                          direction: Axis.horizontal,
                          spacing: 8,
                          runSpacing: 16,
                          clipBehavior: Clip.antiAlias,
                          children: [
                            FeatureRecipe(
                                amount: "${recipe.maxTime}", type: "time"),
                            const FeatureRecipe(amount: "03", type: "person"),
                            FeatureRecipe(
                                amount: "${recipe.calories}", type: "calories"),
                            FeatureRecipe(amount: recipe.level!, type: "level"),
                          ]),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            //section ingredients
                            Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Ingredients",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: Wrap(
                                      direction: Axis.vertical,
                                      runSpacing: 4,
                                      spacing: 4,
                                      children: const [
                                        IngredientItem(
                                          name: "2 eggs",
                                        ),
                                        IngredientItem(
                                          name: "2 eggs",
                                        ),
                                        IngredientItem(
                                          name: "2 eggs",
                                        ),
                                        IngredientItem(
                                          name: "2 eggs",
                                        ),
                                      ],
                                    ),
                                  )
                                ]),
                          ]),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Directions",
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                              Column(
                                children: [
                                  Text("Lorem ipsum"),
                                  Text("Lorem ipsum"),
                                  Text("Lorem ipsum"),
                                  Text("Lorem ipsum"),
                                ],
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                body: SizedBox(
                    width: double.maxFinite,
                    height: screenSize.height,
                    child: Stack(
                      children: [
                        Positioned(
                            child: Container(
                          width: double.maxFinite,
                          height: 350,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage("${recipe.image}"),
                                  fit: BoxFit.cover)),
                        )),
                        Positioned(
                            top: 20,
                            left: 20,
                            right: 20,
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                      width: 42,
                                      height: 42,
                                      decoration: BoxDecoration(
                                          color: Colors.amberAccent,
                                          borderRadius:
                                              BorderRadius.circular(42 / 2)),
                                      child: const Icon(
                                          Icons.arrow_back_ios_new_rounded)),
                                ),
                                const Spacer(),
                                Container(
                                    width: 42,
                                    height: 42,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(42 / 2)),
                                    child: const Icon(Icons.bookmark_border)),
                              ],
                            ))
                      ],
                    )),
              );
            }),
      ),
    );
  }
}
