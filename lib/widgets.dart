import 'dart:ui';

import 'package:flutter/material.dart';

class FrostedGlass extends StatelessWidget {
  const FrostedGlass({
    super.key,
    required this.child,
    required this.height,
    required this.width,
  });
  final double height;
  final double width;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Container(
        child: Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 15,
                sigmaY: 15,
              ),
              child: Container(
                height: height,
                width: width,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.white.withOpacity(0.2), width: 1),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      blurRadius: 30,
                      offset: Offset(2, 2),
                    ),
                  ],
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.white.withOpacity(0.2),
                        Colors.white.withOpacity(0.2),
                      ],
                      stops: [
                        0.0,
                        1.0,
                      ]),
                ),
                child: child,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Custombutton extends StatelessWidget {
  const Custombutton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(),
    );
  }
}
