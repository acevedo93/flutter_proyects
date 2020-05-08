
import 'dart:async';

import 'package:qr/models/scan_model.dart';
import 'package:qr/providers/db_provider.dart';

class ScansBloc {
  static final ScansBloc _singleton = new ScansBloc._internal();

  factory ScansBloc() {
    return _singleton; 
  }

  ScansBloc._internal() {
    // Obtener Scans de la Base de datos 
    getAllScan();
  }

  final _scansController = StreamController<List<ScanModel>>.broadcast();

  Stream<List<ScanModel>> get scansStream => _scansController.stream;

  dispose () {
    _scansController?.close();
  }


  getAllScan() async {
    _scansController.sink.add(await DbProvider.db.getAllScan());
  }
  
  newScan(ScanModel scan) async {
    await DbProvider.db.newScan(scan);
    getAllScan();
  }

  removeScan(int id) async {
    await DbProvider.db.removeScan(id);
    getAllScan();
  }

  deleteAll() async {
    await DbProvider.db.deleteAll();
    getAllScan();
  } 

}