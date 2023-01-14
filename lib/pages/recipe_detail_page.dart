import 'package:flutter/material.dart';

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
              return SizedBox(
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
                          )),
                      Positioned(
                          top: 250,
                          child: Container(
                            padding: const EdgeInsets.only(
                                top: 32, left: 16, right: 16),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 250,
                                          child: Text(
                                            "${recipe.name}",
                                            style: TextStyle(fontSize: 28),
                                          ),
                                        ),
                                        Text("American")
                                      ],
                                    ),
                                    const Spacer(),
                                    Container(
                                        padding: const EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                            color: Colors.amberAccent,
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: Row(
                                          children: [
                                            Icon(Icons.star),
                                            Text("${recipe.rating}")
                                          ],
                                        ))
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  height: 116,
                                  child: ListView(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      children: [
                                        Container(
                                          alignment: Alignment.topCenter,
                                          margin: const EdgeInsets.only(
                                              left: 8, right: 8),
                                          padding: const EdgeInsets.only(
                                              top: 8, bottom: 8),
                                          width: 64,
                                          height: 100,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(32),
                                              color: Colors.amberAccent),
                                          child: Column(
                                            children: [
                                              ClipOval(
                                                  child: CircleAvatar(
                                                      radius: 28,
                                                      backgroundColor:
                                                          Colors.white,
                                                      child: const Icon(
                                                        Icons.punch_clock_sharp,
                                                        color: Colors.black,
                                                      ))),
                                              SizedBox(
                                                height: 4,
                                              ),
                                              Text(
                                                "${recipe.maxTime}",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16),
                                              ),
                                              Text("mins")
                                            ],
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.topCenter,
                                          margin: const EdgeInsets.only(
                                              left: 8, right: 8),
                                          padding: const EdgeInsets.only(
                                              top: 8, bottom: 8),
                                          width: 64,
                                          height: 100,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(32),
                                              color: Colors.amberAccent),
                                          child: Column(
                                            children: [
                                              ClipOval(
                                                  child: CircleAvatar(
                                                      radius: 28,
                                                      backgroundColor:
                                                          Colors.white,
                                                      child: const Icon(
                                                        Icons.punch_clock_sharp,
                                                        color: Colors.black,
                                                      ))),
                                              SizedBox(
                                                height: 4,
                                              ),
                                              Text(
                                                "35",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16),
                                              ),
                                              Text("mins")
                                            ],
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.topCenter,
                                          margin: const EdgeInsets.only(
                                              left: 8, right: 8),
                                          padding: const EdgeInsets.only(
                                              top: 8, bottom: 8),
                                          width: 64,
                                          height: 100,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(32),
                                              color: Colors.amberAccent),
                                          child: Column(
                                            children: [
                                              ClipOval(
                                                  child: CircleAvatar(
                                                      radius: 28,
                                                      backgroundColor:
                                                          Colors.white,
                                                      child: const Icon(
                                                        Icons.punch_clock_sharp,
                                                        color: Colors.black,
                                                      ))),
                                              SizedBox(
                                                height: 4,
                                              ),
                                              Text(
                                                "35",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16),
                                              ),
                                              Text("mins")
                                            ],
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.topCenter,
                                          margin: const EdgeInsets.only(
                                              left: 8, right: 8),
                                          padding: const EdgeInsets.only(
                                              top: 8, bottom: 8),
                                          width: 64,
                                          height: 100,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(32),
                                              color: Colors.amberAccent),
                                          child: Column(
                                            children: [
                                              ClipOval(
                                                  child: CircleAvatar(
                                                      radius: 28,
                                                      backgroundColor:
                                                          Colors.white,
                                                      child: const Icon(
                                                        Icons.punch_clock_sharp,
                                                        color: Colors.black,
                                                      ))),
                                              SizedBox(
                                                height: 4,
                                              ),
                                              Text(
                                                "35",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16),
                                              ),
                                              Text("mins")
                                            ],
                                          ),
                                        ),
                                      ]),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [Text("Ingredients")]),
                                )
                              ],
                            ),
                          ))
                    ],
                  ));
            }),
      ),
    );
  }
}
