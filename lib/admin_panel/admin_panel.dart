import 'package:flutter/material.dart';
import 'package:quizapp/admin_panel/add_quiz_sheet_widget.dart';
import 'package:quizapp/admin_panel/delete_quiz_screen.dart';

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
            }, child: Text('add Quiz')),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: () {
              Navigator.push(context,MaterialPageRoute(builder:
               (context) => deletequizscreen(),));
            }, child: Text('Delete Quiz'))
          ],
      
        ),
      ),
    );
  }
}