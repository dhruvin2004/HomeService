import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  splash() {
    Timer(const Duration(seconds: 1), () {
      Navigator.pushReplacementNamed(
        context,
        'main',
      );
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splash();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
            child: Image.asset(
          "image/logo/33.png",
          height: 300,
        )),
      ),
    );
  }
}
