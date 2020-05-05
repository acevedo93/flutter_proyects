import 'package:flutter/material.dart';

final _icons = <String, IconData> {
  'add_alert': Icons.add_alert,
  'accessibility': Icons.accessibility,
  'folder_open': Icons.folder_open,
  'trailing': Icons.arrow_right,
  'autorenew': Icons.autorenew,
  'input': Icons.input,
  'slider': Icons.slideshow,
  'list': Icons.list
};


Icon getIcon( String nameIcon) {

  return Icon(_icons[nameIcon], color: Colors.purpleAccent);

}