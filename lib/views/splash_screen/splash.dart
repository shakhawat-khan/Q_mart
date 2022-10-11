import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hot_e/views/home/home.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override

  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(
      const Duration(seconds: 5),
        ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => Home()))
    );

  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:  SpinKitFadingFour(
          color: Theme.of(context).primaryColor,
          size: 50,
        ),
      )
    );
  }
}
