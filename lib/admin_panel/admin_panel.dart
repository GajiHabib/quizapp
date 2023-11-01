import 'package:flutter/material.dart';
import 'package:quizapp/admin_panel/add_quiz_sheet_widget.dart';

class admin_panel extends StatelessWidget {
  const admin_panel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.amber,
                context: context, builder: (context) =>addquizbottomsheetwidget() ,);
            }, child: Text('add Quiz'))
          ],
      
        ),
      ),
    );
  }
}