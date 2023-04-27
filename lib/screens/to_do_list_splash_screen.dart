import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/bloc/tasks_cubit.dart';
import 'package:to_do_list/screens/tasks.dart';
// import 'package:to_do_list/components//task.dart';
@override
class ToDoListSplashScreen extends StatefulWidget {
  const ToDoListSplashScreen({Key? key}) : super(key: key);

  @override
  State<ToDoListSplashScreen> createState() => _ToDoListSplashScreenState();
}

class _ToDoListSplashScreenState extends State<ToDoListSplashScreen> {
bool _light=true;
//go to the next screen
  @override
  void initState() {
    Future.delayed(Duration(seconds: 5), () {
      Navigator.push(
   context,
          MaterialPageRoute(
            builder: (context) => TasksScreen(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TasksCubit, TasksState>(
  listener: (context, state) {

  },
  builder: (context, state) {
    return Scaffold(

 body:Padding(
   padding: const EdgeInsets.only(top: 130.0),
   child: Center(
     child:Column(
       children: [
         Image(image: AssetImage('assets/3d-illustration-to-do-list-png.png'),width:300,height: 300,),
         Text('TODO LIST',style: TextStyle(fontWeight: FontWeight.w600,color: Colors.blueAccent,fontSize: 55,fontFamily:'DancingScript'),),

       ],
     ),
   ),
 ),
      floatingActionButton:Image(image: AssetImage('assets/1df2396f1eaa146bcb7dd3e73c1dc77b.gif'),width:290,height: 180,) ,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

 );
  },
);

  }
}
