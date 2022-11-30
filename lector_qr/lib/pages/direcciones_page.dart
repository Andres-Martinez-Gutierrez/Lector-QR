import 'package:flutter/material.dart';

import 'package:lector_qr/widgets/scan_list.dart';

class DireccionesPage extends StatelessWidget {
  const DireccionesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScanList(tipo: 'http');
  }
}
