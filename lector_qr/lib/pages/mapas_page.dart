import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lector_qr/providers/scan_list_provider.dart';
import 'package:provider/provider.dart';

class MapasPage extends StatelessWidget {
  const MapasPage({super.key});

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
    return ListView.builder(
      itemCount: scanListProvider.scans.length,
      itemBuilder: (_, index) => ListTile(
        leading: Icon(
          Icons.map,
          color: Theme.of(context).primaryColor,
        ),
        title: Text(
          scanListProvider.scans[index].valor,
        ),
        subtitle: Text('${scanListProvider.scans[index].id}'),
        trailing: const Icon(
          Icons.keyboard_arrow_right,
          color: Colors.grey,
        ),
        onTap: (() => print(scanListProvider.scans[index].id.toString())),
      ),
    );
  }
}
