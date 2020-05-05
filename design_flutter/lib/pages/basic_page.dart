import 'package:flutter/material.dart';

class BasicPage extends StatelessWidget {

  final Map<String,IconData> iconMapping = {
      'call': Icons.call,
      'router': Icons.router,
      'share': Icons.share
    };
  final titleStyle = TextStyle( fontSize: 20.0, fontWeight: FontWeight.bold);
  final subtitleStyle = TextStyle(fontSize: 12.0, fontWeight: FontWeight.w300, color: Colors.black38);
  final icon = Icon(
                Icons.star,
                color: Colors.red,
                size: 30.0
              );

  final image = 'https://www.infobae.com/new-resizer/SqkvGooqrdXQCLtZXYkFqMJkR5U=/750x0/filters:quality(100)/arc-anglerfish-arc2-prod-infobae.s3.amazonaws.com/public/JQX2G3RKWZAEPNY64GRHBCHP5U.jpg';
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
          _imageTop(),
          _title(),
          _share(),
          _description(),
          _description(),
          _description(),
          _description(),
          _description(),
          _description(),
          _description(),
          _description(),
          ],
        )
      )
    );
  }

  Widget _imageTop() {
    return Image(
      image: NetworkImage(image),
    );
  }

  Widget _title() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Ruido de Magia', style: titleStyle),
                SizedBox(height: 7.0),
                Text('Biografia oficial de Spinetta.', style: subtitleStyle)
              ],
            ),
          ),
          Column(
            children: <Widget> [
              icon,
              Text('41',style: titleStyle)
            ]
          )
        ],
      ),
    );
  }

  Widget _share() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
        _shareItem('CALL', 'call' ),
        _shareItem('ROUTE', 'router' ),
        _shareItem('SHARE', 'share')
        ]
      )
    );
  }

  Widget _description() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
      child: Text(
        'Sobre Luis Alberto Spinetta se ha escrito mucho y seguramente se seguirá escribiendo mucho. Es imposible que a un músico de su talla no se le hayan dedicado libros, artículos periodísticos y menciones de todo tipo. Sin embargo, faltaba una biografía completa y oficial, una biografía que abarcara las distintas etapas de su vida con el testimonio de gente que lo conoció de cerca. Y eso es justamente Ruido de magia (Planeta), el libro de Sergio Marchi que acaba de salir a la luz para iluminarnos a todos.',
        style: subtitleStyle,
        textAlign: TextAlign.justify,
      ),
    );
  }
  Widget _shareItem( String text, String icon) {
      return Column(children: <Widget>[
        Icon(
          iconMapping[icon],
          color:Colors.blueAccent,
          size: 30.0
        ),
        Text(text, style: subtitleStyle,)
      ],);
    }
}