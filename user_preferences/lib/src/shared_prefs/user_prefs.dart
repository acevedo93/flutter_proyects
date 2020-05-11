import 'package:shared_preferences/shared_preferences.dart';

class UserPrefs {
   
  static final UserPrefs _instance = new UserPrefs._internal();
  factory UserPrefs(){
    return _instance;
  }

  UserPrefs._internal();
  SharedPreferences prefs;
  
  // Ninguna de estas propiedades se usa
  initPrefs() async{
    prefs = await SharedPreferences.getInstance();
  }

  get genero {
    return prefs.getInt('genero') ?? 1;
  }
  set genero (int value) {
    prefs.setInt('genero', value);
  }

}