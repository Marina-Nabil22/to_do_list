import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/bloc/tasks_cubit.dart';
import 'package:to_do_list/screens/to_do_list_splash_screen.dart';
import 'package:to_do_list/theme_model.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var themeNotifier;
    return MultiBlocProvider(

      providers: [
        BlocProvider( create: (context) => TasksCubit(),
          child: Container(),
        ),
      ],
      child: ChangeNotifierProvider(

        create: (_) => ThemeModel(),
        child: Consumer<ThemeModel>(
          builder: ((context, ThemeModel themeNotifier, child) {
return MaterialApp(
  theme: themeNotifier.isDark ? ThemeData.dark() : ThemeData.light(),
  debugShowCheckedModeBanner: false,
  home: ToDoListSplashScreen(),
);
          }),
      ),
    ));
  }
}










