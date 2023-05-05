import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/bloc/tasks_cubit.dart';
import 'package:to_do_list/bloc/tasks_cubit.dart';
import 'package:to_do_list/bloc/tasks_cubit.dart';
import 'package:to_do_list/bloc/tasks_cubit.dart';

import 'package:to_do_list/components/task.dart';
import 'package:to_do_list/screens/add_task.dart';

import '../services/cash_helper.dart';

class TasksScreen extends StatefulWidget {
  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  TextEditingController titleController =TextEditingController();
  TextEditingController dateController =TextEditingController();
  TextEditingController descriptionController =TextEditingController();

  List<Task>taskslist = [
    Task(title: 'hh', date: "hh", description: 'hhh')
  ];
    @override
    Widget build(BuildContext context) {
      return BlocConsumer<TasksCubit, TasksState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              actions: [
               Center(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 180.0),
                    child: Text('TODO LIST', style: TextStyle(fontSize: 38,
                        fontFamily: ('DancingScript'),
                        color:Colors.white,
                        fontWeight: FontWeight.bold)),
                  ),
                ),


            ],),

            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Image(image: AssetImage(
                      'assets/to-do-list-icon-buy-this-icon-for--0-48-1.png'),
                    height: 220,
                    width: 300,),
                ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Container(
                          child: Text('Your Tasks',style: TextStyle(color: Colors.lightBlue,fontSize: 34,fontWeight:FontWeight.w500),
                          ),
                ),
                        ),

                Expanded(
                  child:
                  ListView.builder(
                     itemCount: TasksCubit.get(context).taskslist.length,
                      itemBuilder: (context, index) {

                        return ListTile(

                          title:Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              width:360 ,
                              height: 100,
                              decoration: BoxDecoration( border: Border.all(color:Colors.lightBlue,width: 4),
                                borderRadius: BorderRadius.circular(20),),

                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 14.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("title:"+SharedPreferencesHelper.getData(key: 'Title'), style: TextStyle(color: Colors.lightBlue,fontSize: 23,fontWeight:FontWeight.w500,)),
                                        Text("Date:"+SharedPreferencesHelper.getData(key: 'Date'),style: TextStyle(color: Colors.lightBlue,fontSize: 23,fontWeight:FontWeight.w500,)),
                                        Text("Description:"+SharedPreferencesHelper.getData(key: 'Description'),style: TextStyle(color: Colors.lightBlue,fontSize: 23,fontWeight:FontWeight.w500,))
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        );
                      }),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 280.0, bottom: 30),
                  child: Container(
                    width: 80,
                    height: 70,
                    child: ElevatedButton(
                      style: ButtonStyle(alignment: Alignment.center),
                      child: Icon(Icons.add_circle_outline_rounded, size: 43),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>AddTask() ),
                        );
                      },
                    ),
                  ),
                ),

              ],
            ),
          );
        },
      );
    }
  }

