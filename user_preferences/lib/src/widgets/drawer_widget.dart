import 'package:flutter/material.dart';
import 'package:user_preferences/src/pages/home_page.dart';
import 'package:user_preferences/src/pages/settings_page.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _renderDrawer(context);
  }

  Widget _renderDrawer(BuildContext context) {
   return Drawer( 
     child: ListView(
       padding: EdgeInsets.zero,
       children: <Widget>[
         DrawerHeader(
           child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/img/back.jpg'),
              fit: BoxFit.cover
              ),
            ),
           ),
         ),
         ListTile(
           leading: Icon(Icons.access_alarm, color: Colors.blue),
           title: Text('Pages'),
           onTap: (){
             Navigator.pushNamed(context, HomePage.routeName);
           },
          ),
          ListTile(
           leading: Icon(Icons.party_mode, color: Colors.blue),
           title: Text('Party mode'),
           onTap: (){},
          ),
          ListTile(
           leading: Icon(Icons.people, color: Colors.blue),
           title: Text('People'),
           onTap: (){},
          ),
          ListTile(
           leading: Icon(Icons.settings, color: Colors.blue),
           title: Text('Settings'),
           onTap: () {
            Navigator.pop(context);
            // Navigator.pushNamed(context, SettingsPage.routeName);
            Navigator.pushReplacementNamed(context, SettingsPage.routeName);
            } 
          ),
       ],
     ) ,
   );
}}