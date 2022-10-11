import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hot_e/Routes/route.dart';

import 'package:page_transition/page_transition.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

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
        appBar: AppBar(title: Text('Log In'),automaticallyImplyLeading: false),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 70.0, right: 30.0, left: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Image.asset('assets/logo.png',width: MediaQuery.of(context).size.width/2),
                  ],
                ),

                const SizedBox(
                  height: 20,
                ),

                const TextField(
                  decoration: InputDecoration(
                    hintText: 'Email Address',
                    contentPadding:
                    EdgeInsets.only(top: 12.0, bottom: 12.0),
                  ),
                ),

                ElevatedButton(onPressed: (){

                  Navigator.of(context).pushNamed(RouteManager.singUp);

                }, child: Text('sign in button'))



              ],
            ),
          ),
        ),
      ),
    );
  }
}
