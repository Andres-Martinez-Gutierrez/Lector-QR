import 'package:flutter/cupertino.dart';

import 'package:lector_qr/models/scan_model.dart';
import 'package:url_launcher/url_launcher.dart';

Future urlLauncher(BuildContext context, ScanModel scan) async {
  final Uri url = Uri.parse(scan.valor);
  // as Uri convierte un string en tipo Uri, que es lo que necesita el launch
  final tipo = scan.tipo;

  if (tipo == 'http') {
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  } else {
    Navigator.pushNamed(context, 'mapa', arguments: scan);
  }
}
