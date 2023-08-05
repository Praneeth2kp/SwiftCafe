import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:cafe_shop/data.dart';
import 'package:cafe_shop/home.dart';

class DetailPage extends StatefulWidget {
  const DetailPage(
      {super.key,
      required this.title,
      required this.image,
      required this.desc,
      required this.count,
      required this.rating});
  final String image;
  final String title;
  final String rating;
  final String count;
  final String desc;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  var btn = 0;
  var tbtn = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        fit: StackFit.passthrough,
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          Container(
            width: double.infinity,
            child: Image.asset(
              widget.image,
              fit: BoxFit.fitWidth,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.width - 10,
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.amber.withOpacity(0.1),
                // borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage("assets/images/bg.png"),
                  fit: BoxFit.fill,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 7,
                    sigmaY: 7,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        colors: [
                          Colors.white.withOpacity(0.1),
                          Colors.white.withOpacity(0.1),
                          Colors.white.withOpacity(0.3),
                          Colors.white.withOpacity(0.1),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 30.0,
                          left: 20,
                          right: 20,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.title,
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.grey[300],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          widget.rating,
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Image.asset("assets/images/star.png"),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "(${widget.count})",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Image.asset(
                                          "assets/images/Image.png",
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Container(
                                  width: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.grey[300],
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Icon(Icons.remove),
                                      Text("1"),
                                      Icon(Icons.add),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              child: Text(
                                widget.desc,
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey,
                                ),
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 4,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),

                            Text(
                              "Choice of Cup Filling",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey[300],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            //cup filling buttons start here
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  height: 30,
                                  width: 60,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                        (btn == 0)
                                            ? Color.fromRGBO(55, 173, 84, 1)
                                            : Color.fromRGBO(217, 217, 217, 1),
                                      ),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        btn = 0;
                                      });
                                    },
                                    child: Text(
                                      "Full",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                        color: (btn == 0)
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                  width: 80,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                        (btn == 1)
                                            ? Color.fromRGBO(55, 173, 84, 1)
                                            : Color.fromRGBO(217, 217, 217, 1),
                                      ),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        btn = 1;
                                      });
                                    },
                                    child: Text(
                                      "1/2 Full",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                        color: (btn == 1)
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                  width: 80,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                        (btn == 2)
                                            ? Color.fromRGBO(55, 173, 84, 1)
                                            : Color.fromRGBO(217, 217, 217, 1),
                                      ),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        btn = 2;
                                      });
                                    },
                                    child: Text(
                                      "3/4 Full",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                        color: (btn == 2)
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                  width: 80,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                        (btn == 3)
                                            ? Color.fromRGBO(55, 173, 84, 1)
                                            : Color.fromRGBO(217, 217, 217, 1),
                                      ),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        btn = 3;
                                      });
                                    },
                                    child: Text(
                                      "1/4 Full",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                        color: (btn == 3)
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            //cup filling buttons row end here
                            SizedBox(
                              height: 20,
                            ),

                            Text(
                              "Choice of Milk",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey[300],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text("data")
                            // GridView.builder(
                            //   gridDelegate:
                            //       SliverGridDelegateWithFixedCrossAxisCount(
                            //     crossAxisCount: 2,
                            //     crossAxisSpacing: 10,
                            //     mainAxisSpacing: 10,
                            //     childAspectRatio: 1 / 2,
                            //   ),
                            //   physics: ScrollPhysics(),
                            //   shrinkWrap: true,
                            //   itemCount: milks.length,
                            //   itemBuilder: ((context, index) => Container(
                            //         height: 30,
                            //         color: Colors.amber,
                            //         child: Row(
                            //           children: [
                            //             Switch(
                            //               trackColor: MaterialStateProperty.all(
                            //                   Colors.black38),
                            //               activeColor:
                            //                   Colors.green.withOpacity(0.4),
                            //               inactiveThumbColor:
                            //                   Colors.red.withOpacity(0.4),
                            //               value: (tbtn == index) ? true : false,
                            //               onChanged: (value) =>
                            //                   setState(() => tbtn = index),
                            //             ),
                            //             Text(
                            //               milks[index],
                            //             ),
                            //           ],
                            //         ),
                            //       )),
                            // )
                            // GridView.count(
                            //   shrinkWrap: true,
                            //   scrollDirection: Axis.vertical,
                            //   // Create a grid with 2 columns. If you change the scrollDirection to
                            //   // horizontal, this produces 2 rows.
                            //   crossAxisCount: 2,
                            //   // Generate 100 widgets that display their index in the List.
                            //   children: List.generate(100, (index) {
                            //     return SizedBox(
                            //       child: Text(
                            //         'Item $index',
                            //         style:
                            //             Theme.of(context).textTheme.headline5,
                            //       ),
                            //     );
                            //   }),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      // bottomNavigationBar: BottomCustomBar2(),
    );
  }
}

class BottomCustomBar2 extends StatelessWidget {
  const BottomCustomBar2({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 28.0,
        right: 28,
        bottom: 25,
      ),
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 15,
            sigmaY: 15,
          ),
          child: Material(
            // elevation: 10,
            color: Colors.black.withOpacity(0.45),
            borderRadius: BorderRadius.circular(10),

            child: Container(
              width: 50,
              height: 65,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
