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
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                            width: 42,
                            height: 42,
                            decoration: BoxDecoration(
                                color: Colors.amberAccent,
                                borderRadius: BorderRadius.circular(42 / 2)),
                            child:
                                const Icon(Icons.arrow_back_ios_new_rounded)),
                      ),
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
                        const EdgeInsets.only(top: 32, left: 16, right: 16),
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
                                  margin:
                                      const EdgeInsets.only(left: 8, right: 8),
                                  padding:
                                      const EdgeInsets.only(top: 8, bottom: 8),
                                  width: 64,
                                  height: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(32),
                                      color: Colors.amberAccent),
                                  child: Column(
                                    children: [
                                      ClipOval(
                                          child: CircleAvatar(
                                              radius: 28,
                                              backgroundColor: Colors.white,
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
                                  margin:
                                      const EdgeInsets.only(left: 8, right: 8),
                                  padding:
                                      const EdgeInsets.only(top: 8, bottom: 8),
                                  width: 64,
                                  height: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(32),
                                      color: Colors.amberAccent),
                                  child: Column(
                                    children: [
                                      ClipOval(
                                          child: CircleAvatar(
                                              radius: 28,
                                              backgroundColor: Colors.white,
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
                                  margin:
                                      const EdgeInsets.only(left: 8, right: 8),
                                  padding:
                                      const EdgeInsets.only(top: 8, bottom: 8),
                                  width: 64,
                                  height: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(32),
                                      color: Colors.amberAccent),
                                  child: Column(
                                    children: [
                                      ClipOval(
                                          child: CircleAvatar(
                                              radius: 28,
                                              backgroundColor: Colors.white,
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
                                  margin:
                                      const EdgeInsets.only(left: 8, right: 8),
                                  padding:
                                      const EdgeInsets.only(top: 8, bottom: 8),
                                  width: 64,
                                  height: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(32),
                                      color: Colors.amberAccent),
                                  child: Column(
                                    children: [
                                      ClipOval(
                                          child: CircleAvatar(
                                              radius: 28,
                                              backgroundColor: Colors.white,
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
