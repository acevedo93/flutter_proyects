import 'package:flutter/material.dart';
import 'package:flutter_components/src/providers/menu_provider.dart';
import 'package:flutter_components/src/utils/icon_string_util.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
      centerTitle: true,
      title: Text('Flutter components'),
      ),
    body: _lista()
    );
  }


  Widget _lista() {
    return FutureBuilder(
      future: menuProvider.loadData(),
      initialData: [],
      builder: ( context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _listItems(snapshot.data, context),
        ); 
      },
    );
  }

  List<Widget> _listItems(List<dynamic> data, BuildContext context) {
    final List<Widget> opts = <Widget>[];
    data.forEach((opt) {
      final widgetTemp = setItemMenu(context, opt);
      opts..add(widgetTemp)..add(Divider());
    });
    return opts;
  }

  void redirectTo (BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }


  ListTile  setItemMenu(context,opt) {
    return ListTile(
        title: Text( opt['texto']), 
        leading: getIcon(opt['icon']),
        trailing: Icon(Icons.arrow_right, color: Colors.purpleAccent),
        onTap: () => redirectTo(context,opt['ruta'])
      );
  }
}
  // void setRoute(context) {
  //   final route = MaterialPageRoute(builder: (context)=> AlertPage());
  //   Navigator.push(context,route);
  // }