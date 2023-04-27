import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/bloc/tasks_cubit.dart';
import 'package:to_do_list/components/task.dart';

class AddTask extends StatefulWidget {
  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {


  bool _ligth=true;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white,actions: [

        Padding(
          padding: const EdgeInsets.only(right: 150.0,top: 8),
          child: Text('TODO LIST',style: TextStyle(fontSize: 38,fontFamily: ('DancingScript'),color: Colors.lightBlue.shade700,fontWeight: FontWeight.bold)),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Switch(value: _ligth, onChanged: (toggle) {
            setState(() {
              _ligth = toggle;
            });
          }),
        ),
      ],  ),
      body:Container(

        color: Colors.white,
        child:  Column(
          children: [


            Padding(
              padding: const EdgeInsets.all(17.0),
              child: TextFormField(
                controller: TextEditingController(),
                  style: TextStyle(fontSize: 23),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Title',

                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 17.0,left: 17,right: 17),
              child: TextFormField(
                controller: TextEditingController(),
                style: TextStyle(fontSize: 23),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Date',
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 17.0,left: 17,right: 17),
              child: TextFormField(
                controller: TextEditingController(),
                style: TextStyle(fontSize: 23),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Description',

                ),
              ),
            ),


           Padding(
             padding: const EdgeInsets.only(top: 30),
             child: Row(
               mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
//style: ButtonStyle(alignment: Alignment.bottomLeft),
                    child: Icon(CupertinoIcons.return_icon),
                    onPressed: () {
                      Navigator.pop(
                        context,
                      );
                    },
                  ),
                  ElevatedButton(
                    child: Text('Add'),
                    onPressed: () {
                      TasksCubit.get(context).taskslist.add(Task(title:TextEditingController().text , date: TextEditingController().text, description: TextEditingController().text));
Navigator.pop(context);
                    },
                  ),
                ],
             ),
           )

          ],

        ),
      )
    );
  }
}


//IconButton(onPressed: ()=>setState(()=>) , icon:Icon(Icons.add_circle))


