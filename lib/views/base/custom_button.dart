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
    return InkWell(
      onTap:(){
        widget.onPressed();
      },
      child: Card(
        color: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(5),
        ),
        elevation: 5,
        child:  Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10)
          ),
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          height: 40.0,
          //color: Theme.of(context).primaryColor,
          child: Text(widget.name,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w800,fontSize: 15),),
        ),
      ),
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
