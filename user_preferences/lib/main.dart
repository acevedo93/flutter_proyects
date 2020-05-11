import 'package:flutter/material.dart';
import 'package:user_preferences/src/pages/home_page.dart';
import 'package:user_preferences/src/pages/settings_page.dart';
import 'package:user_preferences/src/shared_prefs/user_prefs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new UserPrefs();
  prefs.initPrefs();
  runApp(UserPreferences());
  
}

class UserPreferences extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Preferencias del ususario',
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName : (BuildContext context) => HomePage(),
        SettingsPage.routeName: (BuildContext context) => SettingsPage()
      }
    );
  }
}