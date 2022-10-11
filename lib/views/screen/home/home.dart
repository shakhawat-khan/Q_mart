import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Home extends StatelessWidget {
  late DateTime currentBackPressTime;




  @override
  Widget build(BuildContext context) {

    Future<bool> showExitPopup() async {
      return await showDialog( //show confirm dialogue
        //the return value will be from "Yes" or "No" options
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Exit App'),
          content: Text('Do you want to exit an App?'),
          actions:[
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(false),
              //return false when click on "NO"
              child:Text('No'),
            ),

            ElevatedButton(
              onPressed: () => SystemNavigator.pop(),
              //return true when click on "Yes"
              child:Text('Yes'),
            ),

          ],
        ),
      )??false; //if showDialouge had returned null, then return false
    }


    return WillPopScope(

      onWillPop: showExitPopup,

      child: Scaffold(
          backgroundColor: const Color(0xFFF1F3F6),
        appBar: AppBar(
          title: Text('Q Mart'),
          automaticallyImplyLeading: false,

        ),
        body: SingleChildScrollView(
          child: Column(
            children: [

              Image.asset('assets/logo.png'),

              Text('hello'),
            ],
          ) ,
        )
      ),
    );
  }

}
