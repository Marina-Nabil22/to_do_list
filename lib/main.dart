import 'package:flutter/cupertino.dart';
import 'package:to_do_list/services/cash_helper.dart';
import 'package:to_do_list/src/app_root.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesHelper.init();
  runApp(
  AppRoot(
  ));

}