import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {

  final String name;
  final Function onPressed;

  const CustomButton({super.key,

    required this.name,
    required this.onPressed,

  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        child: new InkWell(
          onTap:(){
            widget.onPressed();
          },
          child: new Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            height: 40.0,
            child: Text(widget.name,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w800,fontSize: 15),),
          ),
        ),
        color: Colors.transparent,
      ),
      color: Theme.of(context).primaryColor,
    );


    /*InkWell(
      onTap: (){
        print('object');

      },
        child: Container(
          alignment: Alignment.center,

          height: 40,
          width: MediaQuery.of(context).size.width,
          color: Theme.of(context).primaryColor,
          child: Text(name,style: TextStyle(color: Colors.white),),
        ),

      focusColor: Colors.black,
    );*/
  }
}
