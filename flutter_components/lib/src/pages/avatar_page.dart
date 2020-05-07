import 'package:flutter/material.dart';



class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar page'),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 10),
            child: CircleAvatar(
              child: Text('SL'),
              backgroundColor: Colors.brown,

              ),
          ),
          Container(
            padding: EdgeInsets.all(5.0),
            child: CircleAvatar(
             backgroundImage: NetworkImage('https://www.placecage.com/200/200',),
             radius: 30.0 ,

              ),
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
          image: NetworkImage('https://www.placecage.com/500/500'),
          placeholder: AssetImage('assets/original.gif'),
          fadeInDuration: Duration(milliseconds: 100),
          fadeOutDuration: Duration(milliseconds: 100) 
          ,),
      ),
    );
  }
}