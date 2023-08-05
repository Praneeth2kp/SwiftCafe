import 'package:flutter/material.dart';
import 'package:cafe_shop/home.dart';

import 'package:cafe_shop/widgets.dart';

class Loginpage extends StatelessWidget {
  const Loginpage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var _opacity = 1.0;
    var _xOffset = 0.0;
    var _yOffset = 0.0;
    var _blurRadius = 0.0;
    // return Scaffold(
    //   body: Container(
    //     decoration: BoxDecoration(
    //       gradient: LinearGradient(
    //         begin: Alignment.topLeft,
    //         end: Alignment.bottomRight,
    //         colors: [
    //           Colors.white.withOpacity(0.5),
    //           Colors.white.withOpacity(0.1),
    //         ],
    //         stops: [
    //           0.0,
    //           1.0,
    //         ],
    //       ),
    //       image: DecorationImage(
    //         image: AssetImage("assets/images/bg.png"),
    //         fit: BoxFit.cover,
    //       ),
    //     ),
    //     child: Center(
    //       child: ClipRRect(
    //         borderRadius: BorderRadius.circular(20),
    //         child: BackdropFilter(
    //           filter: ImageFilter.blur(
    //             // sigmaX: 15.0,
    //             sigmaX: 07,
    //             // sigmaY: 15.0,
    //             sigmaY: 07,
    //           ),
    //           child: Container(
    //             color: Colors.white.withOpacity(0.1),
    //             height: 700,
    //             width: 300,
    //             child: Column(
    //               children: [
    //                 TextField(),
    //                 TextField(),
    //               ],
    //             ),
    //           ),
    //         ),
    //       ),
    //     ),
    //   ),
    // );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/bg.png",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
            child: Container(
          child: FrostedGlass(
            height: size.height - 150,
            width: size.width - 50,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/logo.png"),
                  Image.asset("assets/images/logon.png"),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Text(
                      '"latte but never late"',
                      style: TextStyle(
                        backgroundColor: Colors.white.withOpacity(0.05),
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "User Name",
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Password",
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    ),
                    child: Container(
                      width: 200,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: <Color>[
                              Color.fromRGBO(77, 43, 26, 1),
                              Color.fromRGBO(167, 116, 90, 1),
                            ],
                          ),
                          borderRadius:
                              BorderRadius.all(Radius.circular(80.0))),
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Center(
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    ),
                    child: Container(
                      width: 200,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 1),
                          borderRadius:
                              BorderRadius.all(Radius.circular(80.0))),
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Center(
                        child: const Text(
                          'Signup',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Privacy Policy",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }
}
