import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hot_e/Routes/route.dart';
import 'package:hot_e/views/base/custom_button.dart';

import 'package:page_transition/page_transition.dart';

import '../../../base/custom_text_field.dart';
import '../forget_password.dart';

class Login extends StatelessWidget {

  final FocusNode _email = FocusNode();
  final FocusNode _password = FocusNode();


  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  Login({super.key});
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/logo.png',width: MediaQuery.of(context).size.width/2),
                  ],
                ),

                const SizedBox(
                  height: 20,
                ),

                CustomTextField(
                    hintText: 'Email Address or User Name',
                    controller: _emailController,
                    focusNode: _email,
                    nextFocus: _password,
                    prefixIcon:const Icon(Icons.email_outlined),
                    divider: true
                ),

                const SizedBox(
                  height: 11.0,
                ),

                CustomTextField(
                    hintText: 'Password',
                    controller: _passwordController,
                    focusNode: _password,
                    nextFocus: _password,
                    prefixIcon:const Icon(Icons.password_outlined),
                    divider: true
                ),

                Container(
                  alignment: Alignment.bottomRight,
                  child: InkWell(
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontFamily: 'Alatsi',
                        fontSize: 15.0,
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamed(RouteManager.forgetPassword);
                    },
                  ),
                ),

                const SizedBox(
                  height: 11.0,
                ),

                 CustomButton(name: 'Log IN',onPressed: (){
                    Navigator.of(context).pushNamed(RouteManager.home);
                 }
                 ),

                SizedBox(height: 15,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Don\'t Have an Account?',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 15.0,
                      ),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    InkWell(
                      child: Text(
                        'Register',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).pushNamed(RouteManager.singUp);
                      },
                    ),
                  ],
                ),

                SizedBox(height: 5,),

                Text(
                  "Continue with",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18.0,
                    fontFamily: 'Alatsi',
                    fontWeight: FontWeight.bold,
                  ),
                ),

                /*Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 2,
                    width: 105.0,
                    color: Colors.grey,
                  ),
                  Text(
                    'Or login with',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(fontSize: 12),
                        color: Colors.grey,
                        fontWeight: FontWeight.w500),
                  ),
                  Container(
                    height: 2,
                    width: 105.0,
                    color: Colors.grey,
                  ),
                ],
              ),*/
                SizedBox(
                  height: 37,
                ),
                 Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 45,
                      width: 150,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        borderOnForeground: true,
                        child: Padding(
                          padding: EdgeInsets.all(6),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                  'assets/google_icon.png'), // <-- Use 'Image.asset(...)' here
                              SizedBox(width: 5),
                              Text(
                                'Google',
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(fontSize: 12),
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 13,
                  ),
                  Container(
                    height: 45,
                    width: 150,
                    child: InkWell(
                      onTap: () {
                        //print('hello');
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        borderOnForeground: true,
                        child: Padding(
                          padding: EdgeInsets.all(6),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                  'assets/fb_icon.png'), // <-- Use 'Image.asset(...)' here
                              SizedBox(width: 5),
                              Text(
                                'Facebook',
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(fontSize: 12),
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )



              ],
            ),
          ),
        ),
      ),
    );
  }
}
