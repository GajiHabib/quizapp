
import 'package:flutter/material.dart';

import 'homescreen.dart';

class Resultscreen extends StatelessWidget {
  final int score;
  const Resultscreen({super.key,required this.score});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height:100,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(child: Text('your score:$score')),
        ),
        SizedBox(height: 350,),

        Container(child: ElevatedButton(onPressed: () {
          Navigator.pushReplacement(context,MaterialPageRoute(builder:
          (context) => homescreen(), ));
        },child: Text('go to home'),
        ),),
        // SizedBox(height: 70,),
      ],),),
    );
  }
}