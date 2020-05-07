
import 'package:flutter/material.dart';
import 'dart:math';


class AnimatedContainerPage extends StatefulWidget {
  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {

  double _width = 50.0;
  double _height = 50.0;
  Color _color = Colors.pink;
  bool _stateButton = false;
  int _duration = 200;

  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated_container'),
      ),
      body: Center(
        child: AnimatedContainer(
          curve: Curves.fastOutSlowIn,
          duration: Duration(milliseconds: _duration),
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            borderRadius: _borderRadius,
            color: _color
          ),  
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon( _stateButton == false ? Icons.play_arrow : Icons.stop),
        onPressed: () => _changeProperties()
      ),
    );
  }

  void _changeProperties () {
    final random = Random();
    setState(() {
      _width = random.nextInt(300).toDouble();
      _height = random.nextInt(300).toDouble();
      _color = Color.fromRGBO(
        random.nextInt(255),
        random.nextInt(255),
        random.nextInt(255),
        1);
      _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());
      _stateButton = _stateButton == true ? false : true;
      _duration = random.nextInt(1000);
    });
    
  }
}