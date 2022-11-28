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
      itemBuilder: (_, index) => Dismissible(
        key: Key(scans[index].id.toString()),
        //key: UniqueKey(),
        background: Container(
          color: Colors.red,
        ),
        onDismissed: (DismissDirection direction) {
          Provider.of<ScanListProvider>(context, listen: false)
              .borrarScanPorId(scans[index].id!);
        },

        child: ListTile(
          leading: Icon(
            Icons.assistant_direction,
            color: Theme.of(context).primaryColor,
          ),
          title: Text(
            scanListProvider.scans[index].valor,
          ),
          subtitle: Text('${scans[index].id}'),
          trailing: const Icon(
            Icons.keyboard_arrow_right,
            color: Colors.grey,
          ),
          onTap: (() => print(scans[index].id.toString())),
        ),
      ),
    );
  }
}
