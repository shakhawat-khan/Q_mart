import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hot_e/Routes/route.dart';
import 'package:hot_e/views/base/custom_text_field.dart';

import '../../home/home.dart';

import '../login/log_in.dart';



class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  bool _obscureText = true;
  bool _obscureText1 = true;

  // Toggles the password show status
  void _viewPassword() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _viewPassword1() {
    setState(() {
      _obscureText1 = !_obscureText1;
    });
  }

  final FocusNode _email = FocusNode();
  final FocusNode _username = FocusNode();
  final FocusNode _password = FocusNode();
  final FocusNode _checkPassword = FocusNode();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatPasswordController = TextEditingController();

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
      onWillPop:showExitPopup ,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Sign Up'),
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 70.0, right: 30.0, left: 30.0),
            child: Column(
              children:  [
                /*Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    InkWell(
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).pushNamed(RouteManager.logIn);
                      },
                    ),
                    const Text(
                      'Sign Up',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                  ],
                ),*/

                Image.asset('assets/logo.png',width: MediaQuery.of(context).size.width/2),

                const SizedBox(
                  height: 20,
                ),

                CustomTextField(
                    hintText: 'Email Address',
                    controller: _emailController,
                    focusNode: _email,
                    nextFocus: _username,
                    prefixIcon:const Icon(Icons.email_outlined),
                    divider: true
                ),

                const SizedBox(
                  height: 11.0,
                ),

                CustomTextField(
                    hintText: 'User name',
                    controller: _usernameController,
                    focusNode: _username,
                    nextFocus: _password,
                    prefixIcon:const Icon(Icons.abc_outlined),
                    divider: true
                ),

                const SizedBox(
                  height: 11.0,
                ),


                CustomTextField(
                    hintText: 'password',
                    controller: _passwordController,
                    focusNode: _password,
                    nextFocus: _checkPassword,
                    prefixIcon:const Icon(Icons.password),
                    divider: true,
                    isPassword: true,
                ),

                const SizedBox(
                  height: 11.0,
                ),


                CustomTextField(
                  hintText: 'retype password',
                  controller: _repeatPasswordController,
                  focusNode: _checkPassword,
                  nextFocus: _checkPassword,
                  prefixIcon:const Icon(Icons.password),
                  divider: true,
                  isPassword: true,
                ),

                const SizedBox(height: 50,),

                InkWell(
                  child: Container(
                    height: 45.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      shadowColor: Colors.grey[300],
                      color: Colors.white,
                      borderOnForeground: false,
                      elevation: 5.0,
                      child: GestureDetector(
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.check,
                                color: Theme.of(context).primaryColor,
                              ),
                              const SizedBox(
                                width: 7.0,
                              ),
                              Text(
                                "SIGN UP",
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
                    );
                  },
                ),

                const SizedBox(
                  height: 15.0,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Already have an account?',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 15.0,
                        fontFamily: 'Alatsi',
                      ),
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    InkWell(
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Login()),
                        );
                      },
                    ),
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
