import 'package:flutter/material.dart';
import 'package:putakerikoeh/services/supabase_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(scrollDirection: Axis.vertical, children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 42,
                      height: 42,
                      margin: const EdgeInsets.only(left: 16, top: 16),
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.3),
                          image: const DecorationImage(
                              image: NetworkImage(
                                  "https://i.pinimg.com/originals/cd/5b/e8/cd5be8356e98d48275d2885796035d6b.jpg")),
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    const Spacer(),
                    Container(
                      margin: const EdgeInsets.only(right: 16, top: 16),
                      child: const Icon(
                        Icons.notifications_outlined,
                        size: 32,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                    margin: const EdgeInsets.only(left: 16),
                    child: const Text(
                      "Hello, Theresa!",
                      style: TextStyle(
                          fontSize: 21,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500),
                    )),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 16),
                      child: const Text(
                        "Make your own food,\nstay at home",
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 16, right: 16),
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.withOpacity(0.3),
                      hintText: "Search any recipe",
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: const Icon(Icons.filter_sharp),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(32)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 120,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 8,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: index == 0
                              ? const EdgeInsets.only(left: 16, right: 32)
                              : const EdgeInsets.only(right: 32),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 72,
                                width: 72,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(72),
                                    color: index == 0
                                        ? Colors.amberAccent
                                        : Colors.grey.withOpacity(0.3)),
                                child: const Icon(
                                  Icons.fastfood,
                                  size: 42,
                                ),
                              ),
                              Container(
                                  margin: const EdgeInsets.only(top: 8),
                                  child: const Text(
                                    "Popular",
                                    style: TextStyle(fontSize: 16),
                                  ))
                            ],
                          ),
                        );
                      }),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                    margin: const EdgeInsets.only(left: 16),
                    child: const Text(
                      "Popular Recipes",
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
                    )),
                const SizedBox(
                  height: 20,
                ),
                Container(
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    child: FutureBuilder<List<Map<String, dynamic>>>(
                        future: SupabaseService().getRecipes(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          if (snapshot.data != null && snapshot.data!.isEmpty) {
                            return const Center(
                              child: Text("No tenemos recetas por el momento"),
                            );
                          }
                          final recipes = snapshot.data!;
                          print(recipes);
                          return GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: recipes.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 20,
                                      mainAxisSpacing: 20,
                                      childAspectRatio: 1.5,
                                      mainAxisExtent: 300),
                              itemBuilder: (context, index) {
                                final recipe = recipes[index];
                                return LayoutBuilder(
                                  builder: (context, constraints) => Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        children: [
                                          Stack(
                                            children: [
                                              Positioned(
                                                child: Container(
                                                  //width: double.maxFinite,
                                                  height:
                                                      constraints.maxHeight /
                                                          1.25,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              32),
                                                      image: DecorationImage(
                                                          image: DecorationImage(
                                                                  image: NetworkImage(
                                                                      recipe[
                                                                          "image"]))
                                                              .image,
                                                          fit: BoxFit.cover)),
                                                ),
                                              ),
                                              Positioned(
                                                left: 12,
                                                top: 12,
                                                child: Container(
                                                  width: 100,
                                                  padding:
                                                      const EdgeInsets.all(4),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16),
                                                      color: Colors.black
                                                          .withOpacity(0.3)),
                                                  child: Row(
                                                    children: [
                                                      const Icon(
                                                        Icons.timelapse,
                                                        color: Colors.white,
                                                      ),
                                                      Text(
                                                        "${recipe["max_time"]} mins",
                                                        style: const TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                  right: 12,
                                                  bottom: 12,
                                                  child: Container(
                                                    padding:
                                                        const EdgeInsets.all(2),
                                                    width: 50,
                                                    decoration: BoxDecoration(
                                                        color:
                                                            Colors.amberAccent,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12)),
                                                    child: Row(
                                                      children: [
                                                        const Icon(Icons.star),
                                                        Text(
                                                            "${recipe["rating"]}")
                                                      ],
                                                    ),
                                                  ))
                                            ],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Container(
                                        child: Text(
                                          "${recipe["name"]}",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w600),
                                          overflow: TextOverflow.ellipsis,
                                          //textScaleFactor: 1.5,
                                        ),
                                      ),
                                      Container(
                                        child: const Text(
                                          "Asian",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.grey),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              });
                        }))
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
