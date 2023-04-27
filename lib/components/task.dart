import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/screens/tasks.dart';
class Task extends StatelessWidget {
  Task({ required this.title, required this.date,required this.description});


final  title,description,date;
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
width:360 ,
        decoration: BoxDecoration( border: Border.all(color:Colors.lightBlue,width: 4),
        borderRadius: BorderRadius.circular(20),),
child: Padding(
  padding: const EdgeInsets.all(15.0),
  child:  Row(
mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Title:"+title,style: TextStyle(color: Colors.lightBlue,fontSize: 22,fontWeight:FontWeight.w500,)),

          Text("Date:"+date,style: TextStyle(color: Colors.lightBlue,fontSize: 22,fontWeight:FontWeight.w500,)),

          Text("Description:"+description,style: TextStyle(color: Colors.lightBlue,fontSize: 22,fontWeight:FontWeight.w500)),

        ],

      ),
    ],
  )
),
      ),
    );
  }
}
