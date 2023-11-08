// ignore_for_file: camel_case_types, prefer_const_constructors, use_build_context_synchronously, await_only_futures, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../helpers.dart';

class deletequizscreen extends StatefulWidget {
  const deletequizscreen({super.key});

  @override
  State<deletequizscreen> createState() => _deletequizscreenState();
}

class _deletequizscreenState extends State<deletequizscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Delete Quiz Screen'),),
      body: FutureBuilder(future: Helpers.getAllQuiz(),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.done){
          if(snapshot.data!.isNotEmpty)  {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
             var currentQuiz=snapshot.data![index];
             print(" currentQuiz ${currentQuiz.id}");
             return ListTile(title: Text(currentQuiz.question),
             trailing: IconButton(
              onPressed: () {
                showDialog(context: context, builder: (context) => AlertDialog(
                  title: Text('Are you sure?'),
                  actions: [TextButton(onPressed: () {
                    Navigator.pop(context);
                  }, child: Text('No')),
                  TextButton(onPressed: ()async {
                    await deleteQuiz(currentQuiz.id!);
                    Navigator.pop(context);
                    setState(() {
                      
                    });
                  }, child: Text('yes'))
                  
                  ],
                ),);
              },
              icon: Icon(Icons.delete,color: Colors.redAccent,),
             ),
             );
              
            },);
          }else{
          return Center(child: Text('No Quiz'),);
        }
        }else{
          return Center(child: CircularProgressIndicator(),);
        }
      }
  
      ),
    );
    
  }
  Future<void>deleteQuiz(String docid)async{
    var collectionSnapshot=
    await FirebaseFirestore.instance.collection('allquiz');
       await collectionSnapshot.doc().delete();

  }
}