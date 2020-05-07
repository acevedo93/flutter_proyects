import 'package:flutter/material.dart';
import 'package:qr/models/scan_model.dart';
import 'package:qr/providers/db_provider.dart';

class MapsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DbProvider.db.getAllScan(),
      builder: (BuildContext context, AsyncSnapshot<List<ScanModel>> snapshot){
        if(!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
       final scans = snapshot.data;
        if(scans.length == 0) {
          return Center(
            child: Text('No hay informacion')
          );
        }
        return ListView.builder(
          itemCount: scans.length,
          itemBuilder: (context, i) => ListTile(
            leading: Icon(Icons.cloud_queue, color: Theme.of(context).primaryColor),
            trailing: Icon(Icons.arrow_right, color: Colors.grey),
            title: Text(scans[i].valor)
          ),
        );
      } ,
    );
  }
}