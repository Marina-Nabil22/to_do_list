import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/bloc/tasks_cubit.dart';
import 'package:to_do_list/screens/to_do_list_splash_screen.dart';

class AppRoot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TasksCubit(),
          child: Container(),
        )
      ],
      child: DarkLightTheme(),
    );
  }
}

class DarkLightTheme extends StatefulWidget {

  const DarkLightTheme({
    Key? key,
  }) : super(key: key);
  @override
  State<DarkLightTheme> createState() => _DarkLightThemeState();
}



class _DarkLightThemeState extends State<DarkLightTheme> {
  var _ligth=true;
  static ThemeData _lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      colorScheme: ColorScheme.light(),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color:Colors.lightBlue ),

      )
  );
   static ThemeData _darkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.black,
       buttonTheme: ButtonThemeData(buttonColor: Colors.white),
       appBarTheme: AppBarTheme(
        backgroundColor: Colors.black,
     )
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: _ligth ? _DarkLightThemeState._lightTheme :_DarkLightThemeState._darkTheme,
     //  darkTheme: _DarkLightThemeState._darkTheme,
      home: ToDoListSplashScreen(
      ),
    );
  }
}
