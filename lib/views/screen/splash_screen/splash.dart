import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:page_transition/page_transition.dart';


import '../auth/login/log_in.dart';


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
        ()=>Navigator.push(context,
            PageTransition(child: Login(),
              type:PageTransitionType.rightToLeft,
            duration: Duration(milliseconds: 800),
            )
            )
    );

  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(

        mainAxisAlignment: MainAxisAlignment.center ,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Image.asset('assets/logo.png',width: MediaQuery.of(context).size.width/2),

          SpinKitFadingFour(
            color: Theme.of(context).primaryColor,
            size: MediaQuery.of(context).size.width/8,
          ),
        ],
      )
    );
  }
}
