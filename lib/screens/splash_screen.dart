import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:orelit_assignment/screens/home_screen.dart';
import '../constants/colors.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 70,
            height: 70,
            child: Image.asset("assets/icons/icon.png"),
          ),
          SizedBox(
            width: 30,
          ),
          Container(
            child: Text(
              "NEWS",
              style: TextStyle(
                  color: primaryColor, fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      nextScreen: HomePage(),
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}
