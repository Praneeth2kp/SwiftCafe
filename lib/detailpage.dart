import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:cafe_shop/data.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage(
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
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  @override
  Widget build(BuildContext context) {
    var btn = 0;
    return Scaffold(
      extendBody: true,
      body: SlidePanel(
        title: widget.title,
        image: widget.image,
        desc: widget.desc,
        count: widget.count,
        rating: widget.rating,
      ),
      bottomNavigationBar: BottomCustomBar1(),
    );
  }
}

class SlidePanel extends StatefulWidget {
  const SlidePanel(
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
  State<SlidePanel> createState() => _SlidePanelState();
}

class _SlidePanelState extends State<SlidePanel> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    bool boole = false;
    List<bool> isSelected = [
      true,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false
    ];
    int tbtn = 10;
    var btn = 0;
    return SlidingUpPanel(
      minHeight: MediaQuery.of(context).size.height -
          MediaQuery.of(context).size.width +
          20,
      maxHeight: MediaQuery.of(context).size.height,
      borderRadius: BorderRadius.circular(20),
      panel: Container(
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
          // borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage("assets/images/bg.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 7,
              sigmaY: 7,
            ),
            child: Container(
              decoration: BoxDecoration(
                border: Border(top: BorderSide(color: Colors.grey)),
                gradient: LinearGradient(
                  colors: [
                    Colors.white.withOpacity(0.05),
                    Colors.white.withOpacity(0.15),
                    Colors.white.withOpacity(0.15),
                    Colors.white.withOpacity(0.05),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                              backgroundColor: MaterialStateProperty.all(
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
                                color: (btn == 0) ? Colors.white : Colors.black,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                          width: 80,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
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
                                color: (btn == 1) ? Colors.white : Colors.black,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                          width: 80,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
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
                                color: (btn == 2) ? Colors.white : Colors.black,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                          width: 80,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
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
                                color: (btn == 3) ? Colors.white : Colors.black,
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

                    GridView.count(
                      padding: EdgeInsets.only(top: 10),
                      crossAxisCount: 2,
                      childAspectRatio: (3 / 0.5),
                      // controller: new ScrollController(keepScrollOffset: false),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: List.generate(
                        milks.length,
                        (index) => Container(
                          child: Row(
                            children: [
                              Transform.scale(
                                scaleY: 0.5,
                                scaleX: 0.5,
                                child: CupertinoSwitch(
                                  value: isSelected[index],
                                  onChanged: (
                                    value,
                                  ) {
                                    setState(
                                      () {
                                        isSelected[index] = value;
                                      },
                                    );
                                  },
                                  trackColor: Colors.grey,
                                  thumbColor: Colors.white70,
                                  activeColor: CupertinoColors.activeGreen,
                                ),
                              ),
                              Container(
                                constraints: BoxConstraints(maxWidth: 100),
                                child: Text(
                                  milks[index]["name"],
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Choice of Sugar",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[300],
                      ),
                    ),

                    GridView.count(
                      padding: EdgeInsets.only(top: 10),
                      crossAxisCount: 2,
                      childAspectRatio: (3 / 0.5),
                      // controller: new ScrollController(keepScrollOffset: false),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: List.generate(
                        sugar.length,
                        (index) => Container(
                          child: Row(
                            children: [
                              Transform.scale(
                                scaleY: 0.5,
                                scaleX: 0.5,
                                child: CupertinoSwitch(
                                  value: boole,
                                  onChanged: (
                                    val,
                                  ) {
                                    setState(
                                      () {
                                        boole = val;
                                      },
                                    );
                                  },
                                  trackColor: Colors.grey,
                                  thumbColor: Colors.white70,
                                  activeColor: CupertinoColors.activeGreen,
                                ),
                              ),
                              Container(
                                constraints: BoxConstraints(maxWidth: 100),
                                child: Text(
                                  sugar[index],
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            child: Image.asset(
              widget.image,
              fit: BoxFit.fitWidth,
            ),
          ),
        ],
      ),
    );
  }
}

class BottomCustomBar1 extends StatelessWidget {
  const BottomCustomBar1({super.key});

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
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.crop_square,
                        color: Colors.grey,
                      ),
                      Text(
                        "High Priority",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      Image.asset(
                        "assets/images/error.png",
                      ),
                    ],
                  ),
                  Container(
                    width: 140,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.green,
                        gradient: LinearGradient(
                          colors: [
                            Color.fromRGBO(25, 129, 51, 0.9),
                            Color.fromRGBO(55, 173, 84, 1),
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        )),
                    child: Center(
                        child: Text(
                      "Submit",
                      style: TextStyle(
                        color: Colors.grey[300],
                      ),
                    )),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
