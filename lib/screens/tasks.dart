import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/bloc/tasks_cubit.dart';
import 'package:to_do_list/bloc/tasks_cubit.dart';
import 'package:to_do_list/bloc/tasks_cubit.dart';
import 'package:to_do_list/bloc/tasks_cubit.dart';

import 'package:to_do_list/components/task.dart';
import 'package:to_do_list/screens/add_task.dart';

class TasksScreen extends StatefulWidget {
  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  List<Task>taskslist = [
    Task(title: 'hh', date: "hh", description: 'hhh')
  ];
    //var TasksCubit = TasksCubit.get(context);

    @override
    Widget build(BuildContext context) {
      var _ligth = true;
      return BlocConsumer<TasksCubit, TasksState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(backgroundColor: Colors.white, actions: [

              Padding(
                padding: const EdgeInsets.only(right: 150.0, top: 8),
                child: Text('TODO LIST', style: TextStyle(fontSize: 38,
                    fontFamily: ('DancingScript'),
                    color: Colors.lightBlue.shade700,
                    fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Switch(value: _ligth, onChanged: (toggle) {
                  setState(() {
                    _ligth = toggle;
                  });
                }),
              ),
            ],),

            body: Column(
              children: [
                Image(image: AssetImage(
                    'assets/team-working-checklist-background_23-2148097060.jpg'),
                  height: 300,
                  width: 400,),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Container(
                          child: Text('Your Tasks',style: TextStyle(color: Colors.lightBlue,fontSize: 34,fontWeight:FontWeight.w500),
                          ),
                ),
                        ),

                Expanded(
                  child: ListView.builder(
                     itemCount: TasksCubit.get(context).taskslist.length,
                      itemBuilder: (context, index) {
                       // var task = taskslist[index];
                        return ListTile(
                          title: Column(
                            children: [
                              Task(title: TextEditingController().text,
                                date: DateTime
                                    .now()
                                    .millisecondsSinceEpoch
                                    .toString(),
                                description: TextEditingController()
                            .text,)
                            ],
                          ),
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

