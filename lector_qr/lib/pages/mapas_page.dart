import 'package:flutter/material.dart';

import 'package:lector_qr/widgets/scan_list.dart';

class MapasPage extends StatelessWidget {
  const MapasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScanList(tipo: 'geo');
  }
}
