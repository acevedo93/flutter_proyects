import 'package:design_flutter/pages/basic_page.dart';
import 'package:design_flutter/pages/beuti_design.dart';
import 'package:design_flutter/pages/scroll_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isIos = Theme.of(context).platform == TargetPlatform.iOS;

    if (isIos) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.light.copyWith(
          statusBarColor: Colors.white
        )
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Design_app',
      initialRoute: 'beuti',
      routes: {
        'basic': (BuildContext context ) => BasicPage(),
        'scroll': (BuildContext context ) => ScrollPage(),
        'beuti': (BuildContext context) => BeutiPage()
      }
    );
  }
}
