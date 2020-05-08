
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:qr/models/scan_model.dart';

class DbProvider {
  static Database _database;

  static final DbProvider db = DbProvider._();

  DbProvider._();

  Future<Database> get database async {
    if(_database != null) return _database;
    _database = await initDB();
    return _database;
  }


  initDB() async {
    Directory documentDiectory = await getApplicationDocumentsDirectory();
    final path = join(documentDiectory.path, 'scansDB.db');
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db){},
      onCreate: (Database db, int version) async {
        await db.execute(
          'CREATE TABLE Scans ('
            'id INTEGER PRIMARY KEY,'
            'tipo TEXT,'
            'valor TEXT'
          ')'
        );
      }
    );
  }

  create(ScanModel scan) async {
    final db = await database;
    final res = await db.rawInsert(
      "INSERT Into Scans (id, tipo, valor) "
      "VALUES ('${scan.id}', '${scan.tipo}', '${scan.valor}')"
    );
    return res;
  }

  newScan( ScanModel scan) async {
    final db = await database;
    final res = await db.insert('Scans',scan.toJson());
    return res;
  }
  Future<ScanModel> getScan( int id) async {
    final db = await database;
    final res = await db.query('Scans',where: 'id = ?', whereArgs:[id]);
    return res.isNotEmpty ? ScanModel.fromJson(res.first) : null;
  }

  Future<List<ScanModel>> getAllScan() async {
    final db = await database;
    final res = await db.query('Scans');
    List<ScanModel> list = res.isNotEmpty 
      ? res.map((scan) => ScanModel.fromJson(scan)).toList()
      : [];
    return list;
  }
  Future<List<ScanModel>> getAllScansByType(String type) async {
    final db = await database;
    final res = await db.query('Scans', where: 'type = ?', whereArgs: [type]);
    List<ScanModel> list = res.isNotEmpty
      ? res.map((scan) => ScanModel.fromJson(scan)).toList()
      : [];
    return list;
  }
  Future<int> updateScan( ScanModel newScan) async {
    final db = await database;
    final res = await db.update('Scans', newScan.toJson(), where: 'id = ?', whereArgs: [newScan.id]);
    return res;
  }
  Future<int> removeScan (int id) async {
    final db = await database;
    final res = await db.delete('Scans', where: 'id = ?', whereArgs: [id]);
    return res;
  }
  Future<int> deleteAll () async {
    final db = await database;
    final res = await db.delete('Scans');
    return res;
  }
}
