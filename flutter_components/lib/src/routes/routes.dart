

import 'package:flutter/material.dart';
import 'package:flutter_components/src/pages/alert_page.dart';
import 'package:flutter_components/src/pages/animated_container.dart';
import 'package:flutter_components/src/pages/avatar_page.dart';
import 'package:flutter_components/src/pages/card_page.dart';
import 'package:flutter_components/src/pages/home_page.dart';
import 'package:flutter_components/src/pages/input_page.dart';
import 'package:flutter_components/src/pages/list_page.dart';
import 'package:flutter_components/src/pages/slider_page.dart';

Map<String,WidgetBuilder> getSettingsRoute() {
  return <String, WidgetBuilder> {
  '/': (BuildContext context) => HomePage(),
  'alert': (BuildContext context) => AlertPage(),
  'avatar': (BuildContext context) => AvatarPage(),
  'card': (BuildContext context) => CardPage(),
  'animated':(BuildContext context) => AnimatedContainerPage(),
  'inputs': (BuildContext context) => InputsPage(),
  'slider': (BuildContext context) => SliderPage(),
  'list': (BuildContext context) => ListPage()
  };
}