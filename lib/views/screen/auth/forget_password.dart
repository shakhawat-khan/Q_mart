import 'package:flutter/material.dart';
import 'package:hot_e/util/style.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forget Password',style: interBold,),
      ),
    );
  }
}
