import 'package:flutter/material.dart';


//My own import


import 'package:page_transition/page_transition.dart';

import '../views/screen/home/home.dart';
import '../views/screen/login/log_in.dart';
import '../views/screen/signup/signup.dart';


class RouteManager {

  static const String logIn = '/login';
  static const String singUp = '/singup';
  static const String home = '/home';


  static Route<dynamic> generateRoute (RouteSettings settings){

    var valuePassed;

    if(settings.arguments != null){
      valuePassed = settings.arguments as Map<String,dynamic>;
    }

    switch(settings.name){
      case logIn :
        return PageTransition(child: Login(),
          type: PageTransitionType.rightToLeft,
          duration: const Duration(milliseconds: 700)
        );

      case singUp :
        return MaterialPageRoute(builder: (context){
          return const SignUp();
        });

      case home :
        return MaterialPageRoute(builder: (context){
          return  Home();
        });


      default:
        throw const FormatException('routes not found! Check routes again!');

    }

  }

}