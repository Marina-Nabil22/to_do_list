import 'package:flutter/material.dart';
import 'package:to_do_list/services/theme_preference.dart';
//this._isDark,this._preferences
class ThemeModel extends ChangeNotifier {
  // ThemeModel(){
  //   this._isDark = false;
  //   this._preferences = ThemePreferences();
  //   getPreferences();
  // }
  bool _isDark=false;
  ThemePreferences _preferences=ThemePreferences();
  bool get isDark => _isDark;


//Switching themes in the flutter apps - Flutterant
  set isDark(bool value) {
    _isDark = value;
    _preferences.setTheme(value);
    notifyListeners();
  }

  getPreferences() async {
    _isDark = await _preferences.getTheme();
    notifyListeners();
  }


}