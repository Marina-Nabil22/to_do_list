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
  //var TasksCubit =TasksCubit.get(context).taskslist;
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
        // backgroundColor: Colors.white,actions: [
        //
        // Padding(
        //   padding: const EdgeInsets.only(right: 150.0,top: 8),
        //   child: Text('TODO LIST',style: TextStyle(fontSize: 38,fontFamily: ('DancingScript'),color: Colors.lightBlue.shade700,fontWeight: FontWeight.bold)),
        // ),

        // Padding(
        //   padding: const EdgeInsets.only(left: 20.0),
        //   child: Switch(value: _ligth, onChanged: (toggle) {
        //     setState(() {
        //       _ligth = toggle;
        //     });
        //   }),
        // ),
    //  ],
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
                          // The validator receives the text that the user has entered.
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
                          // The validator receives the text that the user has entered.
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
                          // The validator receives the text that the user has entered.
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
                     //style: ButtonStyle(backgroundColor:),
                     onPressed: () {
                       // Validate returns true if the form is valid, or false otherwise.
                       if (_formKey.currentState!.validate()) {
                         // If the form is valid, display a snackbar. In the real world,
                         // you'd often call a server or save the information in a database.
                         ScaffoldMessenger.of(context).showSnackBar(
                           const SnackBar(content: Text('Processing Data')),

                         );
                         Navigator.push(
                           context,
                           MaterialPageRoute(builder: (context) => TasksScreen()),
                         );
                         // SharedPreferencesHelper.saveData(key: 'Title', value:titleController.text );
                         // SharedPreferencesHelper.saveData(key: 'Date', value:dateController.text );
                         // SharedPreferencesHelper.saveData(key: 'Description', value:descriptionController.text );
                      //  Task(title:titleController.text , date: dateController.text, description: descriptionController.text);
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

//             Padding(
//               padding: const EdgeInsets.all(17.0),
//               child: TextFormField(
//                 controller: titleController,
//                   style: TextStyle(fontSize: 23),
//                 decoration: const InputDecoration(
//                   border: OutlineInputBorder(),
//                   labelText: 'Enter Title',
//
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(bottom: 17.0,left: 17,right: 17),
//               child: TextFormField(
//                 controller: dateController,
//                 style: TextStyle(fontSize: 23),
//                 decoration: const InputDecoration(
//                   border: OutlineInputBorder(),
//                   labelText: 'Enter Date',
//                 ),
//               ),
//             ),
//
//             Padding(
//               padding: const EdgeInsets.only(bottom: 17.0,left: 17,right: 17),
//               child: TextFormField(
//                 controller: descriptionController,
//                 style: TextStyle(fontSize: 23),
//                 decoration: const InputDecoration(
//                   border: OutlineInputBorder(),
//                   labelText: 'Enter Description',
//
//                 ),
//               ),
//             ),
//
//
//            Padding(
//              padding: const EdgeInsets.only(top: 30),
//              child: Row(
//                mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
//                 children: [
//                   ElevatedButton(
// //style: ButtonStyle(alignment: Alignment.bottomLeft),
//                     child: Icon(CupertinoIcons.return_icon),
//                     onPressed: () {
//                       Navigator.pop(
//                         context,
//                       );
//                     },
//                   ),
//                   ElevatedButton(
//                     child: Text('Add'),
//                     onPressed: () {
//                       Task task = Task(title:titleController.text , date: dateController.text, description: descriptionController.text);
//                     //   TasksCubit.get(context).AddTaskFunction();
//  Navigator.pop(context);
//                     },
//                   ),
//                 ],
//              ),
//           )

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


//IconButton(onPressed: ()=>setState(()=>) , icon:Icon(Icons.add_circle))

//ListTile(
//           title: Text(TasksCubit![index]["title"],
//               style: const TextStyle(
//                   fontWeight: FontWeight.w600,
//                   fontSize: 20,
//                   fontFamily: "Tajawal")),
//           subtitle: Text(cubit.tasks![index]["date"]),
//           trailing: Row(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//           Text(
//           "${cubit.tasks![index]["time"]}  ",
//             style: const TextStyle(
//                 fontWeight: FontWeight.bold),
//           ),
//           Transform.translate(
//               offset: const Offset(5, -15),
//               child: IconButton(
//                   onPressed: () {
//                     cubit.deleteTaskFromDB(index+1);
//                   },
//                   icon: Icon(Icons.delete_rounded,
//                       color:
//                       Colors.grey.shade500))),
// ),
