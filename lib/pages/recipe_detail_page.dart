import 'package:flutter/material.dart';

class RecipeDetailPage extends StatelessWidget {
  const RecipeDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.maxFinite,
          height: screenSize.height,
          child: Stack(
            children: [
              Positioned(
                  child: Container(
                width: double.maxFinite,
                height: 350,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://www.san-fernando.com.pe/upload/recetas/u684f4bU5c5EHCnf8AVhKoTrUGAWsfpc9kjeeF5a.png"),
                        fit: BoxFit.cover)),
              )),
              Positioned(
                  top: 20,
                  left: 20,
                  right: 20,
                  child: Row(
                    children: [
                      Container(
                          width: 42,
                          height: 42,
                          decoration: BoxDecoration(
                              color: Colors.amberAccent,
                              borderRadius: BorderRadius.circular(42 / 2)),
                          child: const Icon(Icons.arrow_back_ios_new_rounded)),
                      const Spacer(),
                      Container(
                          width: 42,
                          height: 42,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(42 / 2)),
                          child: const Icon(Icons.bookmark_border)),
                    ],
                  )),
              Positioned(
                  top: 250,
                  child: Container(
                    padding:
                        const EdgeInsets.only(top: 32, left: 32, right: 32),
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
                              children: const [
                                Text(
                                  "Burger",
                                  style: TextStyle(fontSize: 32),
                                ),
                                Text("American")
                              ],
                            ),
                            const Spacer(),
                            Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                    color: Colors.amberAccent,
                                    borderRadius: BorderRadius.circular(8)),
                                child: Row(
                                  children: const [
                                    Icon(Icons.star),
                                    Text("5.0")
                                  ],
                                ))
                          ],
                        ),
                        Container(
                          height: 100,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 4,
                            itemBuilder: (context, index) => Container(
                              margin: EdgeInsets.only(left: 8, right: 8),
                              width: 64,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(32),
                                  color: Colors.amberAccent),
                              child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadiusDirectional.circular(16),
                                      color: Colors.white),
                                  child: const Icon(Icons.punch_clock_sharp)),
                            ),
                          ),
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
