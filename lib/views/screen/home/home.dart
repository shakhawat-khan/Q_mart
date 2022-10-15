import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hot_e/util/style.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late DateTime currentBackPressTime;

  @override
  Widget build(BuildContext context) {



    final urlImages = [
      'assets/slider/slider_1.png',
      'assets/slider/slider_2.png',
      'assets/slider/slider_3.png',
      'assets/slider/slider_4.png',
      'assets/slider/slider_5.png'
    ];

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

    int activeIndex = 0;

    return WillPopScope(

      onWillPop: showExitPopup,

      child: Scaffold(
          backgroundColor: const Color(0xFFF1F3F6),
        appBar: AppBar(
          title: Text('Q Mart',style: interBold,),
          automaticallyImplyLeading: false,

        ),
        body: SingleChildScrollView(
          child: Column(
            children: [

              Center(
                child: CarouselSlider.builder(

                    itemCount: urlImages.length,
                    itemBuilder:(context,index,realIndex){
                      return buildImage(urlImages[index],index);
                    },
                    options:  CarouselOptions(
                        height: 200.0,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        enableInfiniteScroll: true,
                        autoPlayAnimationDuration: Duration(microseconds: 1000),
                        viewportFraction: 1,
                        onPageChanged: (index,reason)=>
                            setState(() {
                              activeIndex = index;
                              //print(activeIndex);
                            })
                    )),
              ),
            ],
          ) ,
        )
      ),
    );

  }

  Widget buildImage(String urlImage , int index){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      color: Colors.blueGrey,
      child: Image.asset(urlImage,fit: BoxFit.cover,),



    );
  }

}
