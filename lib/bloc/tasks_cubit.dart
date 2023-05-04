import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/components/task.dart';
import 'package:to_do_list/services/cash_helper.dart';
part 'tasks_state.dart';
class TasksCubit extends Cubit<TasksState> {
  TextEditingController titleController =TextEditingController();
  TextEditingController dateController =TextEditingController();
  TextEditingController descriptionController =TextEditingController();
  TasksCubit() : super(TasksInitial());
  List<Task>taskslist = [];

static TasksCubit get(context) => BlocProvider.of(context);
  void AddTaskFunction( String Tasktitle,String Taskdate,String Taskdescription) {

      taskslist.add(Task(title:Tasktitle ,date:Taskdate
          , description:Taskdescription));
      SharedPreferencesHelper.saveData(key: 'Title', value:Tasktitle);
      SharedPreferencesHelper.saveData(key: 'Date', value:Taskdate);
      SharedPreferencesHelper.saveData(key: 'Description', value:Taskdescription);
     taskslist.length++;

    emit(AddTaskScreenState());
  }

}
