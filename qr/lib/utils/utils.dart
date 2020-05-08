

import 'package:flutter/material.dart';
import 'package:qr/models/scan_model.dart';
import 'package:url_launcher/url_launcher.dart';

launchScan(ScanModel scan, BuildContext context) async {
  if (scan.tipo == 'http') {
    if (await canLaunch(scan.valor)) {
      await launch(scan.valor);
    } else {
      throw 'No se puede abrir el scan ${scan.valor}';
    }
  } else {
    Navigator.pushNamed(context, 'mapa', arguments: scan );
  }
  
}