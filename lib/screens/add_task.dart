import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/bloc/tasks_cubit.dart';
import 'package:to_do_list/components/task.dart';
import 'package:to_do_list/screens/tasks.dart';
import 'package:to_do_list/services/cash_helper.dart';
import 'package:to_do_list/theme_model.dart';

class AddTask extends StatefulWidget {

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController titleController =TextEditingController();
TextEditingController dateController =TextEditingController();
TextEditingController descriptionController =TextEditingController();


  @override
  Widget build(BuildContext context) {

    return BlocConsumer<TasksCubit, TasksState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    var Cupit=TasksCubit.get(context);
    return Consumer<ThemeModel>(


      builder: (context, ThemeModel themeNotifier, child) {
    return Scaffold(
      appBar: AppBar
        (
        title: Text('TODO LIST',style: TextStyle(fontSize: 38,fontFamily: ('DancingScript'),color: Colors.white,fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
              icon: Icon(themeNotifier.isDark
                  ? Icons.nightlight_round
                  : Icons.wb_sunny),
              onPressed: () {
                themeNotifier.isDark
                    ? themeNotifier.isDark = false
                    : themeNotifier.isDark = true;
              })
        ],
      ),
      body:Container(

        child:  Column(
          children: [
            Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller:titleController ,
                          style: TextStyle(fontSize: 23),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Title',),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller:dateController ,
                          style: TextStyle(fontSize: 23),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Enter Date',),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller:descriptionController ,
                          style: TextStyle(fontSize: 23),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Enter Description',),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                      ),
               Padding(
                 padding: const EdgeInsets.only(top: 30.0),
                 child: ElevatedButton(
                     onPressed: () {

                       if (_formKey.currentState!.validate()) {
                         ScaffoldMessenger.of(context).showSnackBar(
                           const SnackBar(content: Text('Processing Data')),

                         );
                         Navigator.push(
                           context,
                           MaterialPageRoute(builder: (context) => TasksScreen()),
                         );
                         TasksCubit.get(context).AddTaskFunction(titleController.text,dateController.text ,descriptionController.text);

  Navigator.pop(context);
                       }
                     },
                     child: const Text('Submit'),
                   ),
               ),
                    ],
                  ),
                ))

          ],

        ),
      )
    );
  },
);
  },
);
  }
}


