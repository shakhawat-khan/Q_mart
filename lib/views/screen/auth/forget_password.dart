import 'package:flutter/material.dart';
import 'package:hot_e/Routes/route.dart';
import 'package:hot_e/util/style.dart';
import 'package:hot_e/views/base/custom_button.dart';

import '../../base/custom_text_field.dart';

class ForgetPassword extends StatelessWidget {
   ForgetPassword({Key? key}) : super(key: key);

  final FocusNode _email = FocusNode();



   final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forget Password',style: interBold,),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 70.0, right: 30.0, left: 30.0),
          child: Column(
            children: [
              Image.asset('assets/logo.png',width: MediaQuery.of(context).size.width/2),

              const SizedBox(
                height: 20,
              ),

              CustomTextField(
                  hintText: 'Email Address',
                  controller: _emailController,
                  focusNode: _email,
                  nextFocus: _email,
                  prefixIcon:const Icon(Icons.email_outlined),
                  divider: true
              ),

              const SizedBox(
                height: 20,
              ),

              CustomButton(name: 'Reset Password', onPressed: (){
                Navigator.of(context).pushNamed(RouteManager.home);
              })

            ],
          ),
        ),

      ) ,

    );
  }
}
