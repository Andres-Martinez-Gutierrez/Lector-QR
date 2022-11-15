import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:lector_qr/providers/scan_list_provider.dart';

class DireccionesPage extends StatelessWidget {
  const DireccionesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;
    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: (context, index) => ListTile(
        leading: Icon(
          Icons.assistant_direction,
          color: Theme.of(context).primaryColor,
        ),
        title: Text(scans[index].valor),
        subtitle: Text(scans[index].id.toString()),
        trailing: const Icon(Icons.keyboard_arrow_right),
        onTap: () => print(scans[index].id),
      ),
    );
  }
}
