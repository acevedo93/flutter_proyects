import 'package:flutter/material.dart';
import 'package:qr/bloc/scans_bloc.dart';
import 'package:qr/models/scan_model.dart';
import 'package:qr/utils/utils.dart' as utils;

class MapsPage extends StatelessWidget {
  final scansBloc = new ScansBloc();
  @override
  Widget build(BuildContext context) {
    scansBloc.getAllScan();
    return StreamBuilder<List<ScanModel>>(
      stream: scansBloc.scansStream,
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
          itemBuilder: (context, i) => Container(
            child: Dismissible(
              resizeDuration: Duration(milliseconds: 350),
              key: UniqueKey(),
              background: Container(
                color: Colors.red,
              ),
              onDismissed: (direction) => scansBloc.removeScan(scans[i].id),
              child: ListTile(
                onTap: () => utils.launchScan(scans[i], context),
                leading: Icon(Icons.cloud_queue, color: Theme.of(context).primaryColor),
                trailing: Icon(Icons.arrow_right, color: Colors.grey),
                title: Text(scans[i].valor),
                subtitle: Text('ID: ${scans[i].id}'),
              ),
            ),
          ),
        );
      },
    );
  }
}