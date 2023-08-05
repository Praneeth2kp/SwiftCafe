import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:cafe_shop/data.dart';
import 'package:cafe_shop/detail.dart';
import 'package:cafe_shop/detailpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(140.0),

          child: CustomAppBar(),
        ),
        body: Custombody(),
        bottomNavigationBar: BottomCustomBar()
        // backgroundColor: Colors.transparent,
        );
  }
}

class Custombody extends StatelessWidget {
  const Custombody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bg.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: SingleChildScrollView(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 7,
            sigmaY: 7,
          ),
          child: Container(
            margin: EdgeInsets.all(0),
            padding: EdgeInsets.all(0),
            color: Colors.white.withOpacity(0.025),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 190,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Most popular Beverages",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                    ),
                  ),
                ),
                HorizontalList(),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[
                        Colors.white.withOpacity(0.075),
                        Colors.white.withOpacity(0.05),
                      ], // Gradient from https://learnui.design/tools/gradient-generator.html
                      tileMode: TileMode.mirror,
                    ),
                  ),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 10.0,
                          left: 20,
                        ),
                        child: Text(
                          "Get it Instantly",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      Column(
                        children: List.generate(
                          coffes2.length - 1,
                          (index) => Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                              vertical: 10,
                            ),
                            child: GestureDetector(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailsPage(
                                    title: coffes2[index]['title'],
                                    image: coffes2[index]['img'],
                                    rating: coffes2[index]['rating'],
                                    count: coffes2[index]['count'],
                                    desc: coffes2[index]['desc'],
                                  ),
                                ),
                              ),
                              child: Container(
                                height: 163,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color.fromRGBO(180, 180, 180, 0.3),
                                ),
                                padding: EdgeInsets.all(20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          coffes2[index]['title'],
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "${coffes[index]['rating']} ",
                                              style: TextStyle(
                                                fontSize: 12,
                                              ),
                                            ),
                                            Image.asset(
                                                "assets/images/star.png"),
                                            Text(
                                              "  (${coffes[index]['count']}) ",
                                              style: TextStyle(
                                                fontSize: 12,
                                              ),
                                            ),
                                            Image.asset(
                                              "assets/images/Image.png",
                                            ),
                                          ],
                                        ),
                                        Container(
                                          constraints:
                                              BoxConstraints(maxWidth: 180),
                                          child: Text(
                                            coffes2[index]['desc'],
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.grey,
                                            ),
                                            softWrap: true,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 4,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Stack(
                                      children: [
                                        Image.asset(
                                          coffes2[index]["img"],
                                        ),
                                        Positioned(
                                          top: 100,
                                          right: 30,
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                              vertical: 3,
                                              horizontal: 15,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.green,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Text(
                                              "ADD",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // app bar completed
              ],
            ),
          ),
        ),
      ),
    );
  }
}
//popular beverages

class HorizontalList extends StatelessWidget {
  const HorizontalList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          coffes.length,
          (index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                    Colors.white.withOpacity(0.3),
                    Colors.white.withOpacity(0.15),
                    Colors.white.withOpacity(0.3),
                  ], // Gradient from https://learnui.design/tools/gradient-generator.html
                  tileMode: TileMode.mirror,
                ),
              ),
              height: 265,
              width: 213,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    coffes[index]['img'],
                  ),
                  Text(
                    coffes[index]['title'],
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            coffes[index]['contains'],
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                "${coffes[index]['rating']} ",
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                              Image.asset("assets/images/star.png"),
                              Text(
                                "  (${coffes[index]['count']}) ",
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Container(
                          height: 30,
                          width: 30,
                          color: Colors.green,
                          child: Icon(Icons.add),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//custom app bar
class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      backgroundColor: Colors.black.withOpacity(0.5),
      leading: Padding(
        padding: const EdgeInsets.only(
          top: 8.0,
          left: 10,
        ),
        child: Text(
          "👋",
          style: TextStyle(
            fontSize: 27,
          ),
        ),
      ),
      title: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "20/12/2022",
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey[500],
                ),
              ),
              Text(
                "Joshua Scanian",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[400],
                ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(
            right: 10,
          ),
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color.fromRGBO(249, 249, 249, 0.79),
            ),
            padding: EdgeInsets.all(12),
            child: SvgPicture.asset(
              "assets/icons/delete.svg",
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(
            right: 10,
          ),
          child: CircleAvatar(
            backgroundImage: AssetImage("assets/images/dp.png"),
            radius: 19.5,
            // child: Image.asset(
            //   "assets/images/dp.png",

            // ),
          ),
        ),
      ],
      toolbarHeight: 40,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            padding: EdgeInsets.symmetric(horizontal: 10),
            width: MediaQuery.of(context).size.width - 30,
            child: Row(
              children: [
                SvgPicture.asset("assets/icons/search.svg"),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search favourite Beverages",
                      hintStyle: TextStyle(
                        fontSize: 13,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                SvgPicture.asset("assets/icons/filter.svg"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//custom bottom navigation bar
class BottomCustomBar extends StatelessWidget {
  const BottomCustomBar({super.key});

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
                  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black.withOpacity(0.5),
                      border: Border.all(
                        color: Colors.white,
                        width: 0.2,
                      ),
                    ),
                    child: Container(
                      child: Icon(
                        Icons.home_outlined,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ),
                  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      // color: Color.fromRGBO(94, 94, 94, 1),
                    ),
                    child: Container(
                      child: Icon(
                        Icons.account_circle_outlined,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ),
                  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      // color: Color.fromRGBO(94, 94, 94, 1),
                    ),
                    child: Container(
                      child: Icon(
                        Icons.wallet_outlined,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ),
                  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      // color: Color.fromRGBO(94, 94, 94, 1),
                    ),
                    child: Container(
                      child: Icon(
                        Icons.delete,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ),
                  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      // color: Color.fromRGBO(94, 94, 94, 1),
                    ),
                    child: Container(
                      child: Icon(
                        Icons.mark_chat_unread_outlined,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
