// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'Quizscreen.dart';

class homescreen extends StatelessWidget {
  const homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center
      (child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        SizedBox(height: 10,),
        Text
        ('Quiz App',style: TextStyle(fontSize: 50),),
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 250,),
        ElevatedButton(onPressed:
         (){
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => Quizscreen())
            );
        }, child: Text(
          'Next Quiz',style: TextStyle(fontSize: 50),
        ),
        style: ElevatedButton.styleFrom(
          shape: StadiumBorder()
          ),
          )
      ],
      )
      ],
      ),
      ),
    );
  }
}

