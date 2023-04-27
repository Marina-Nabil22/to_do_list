import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/components/task.dart';
part 'tasks_state.dart';
class TasksCubit extends Cubit<TasksState> {

  TasksCubit() : super(TasksInitial());
  List<Task>taskslist = [];

static TasksCubit get(context) => BlocProvider.of(context);
  void AddTaskFunction() {
    for (Task i in taskslist.reversed)
   {
      taskslist.add(Task(title: TextEditingController().text, date: DateTime
          .now()
          .hour, description: TextEditingController().text,));
     taskslist.length++;
  }
    emit(AddTaskScreenState());
  }

}
