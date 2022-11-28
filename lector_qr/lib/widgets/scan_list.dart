import 'package:flutter/material.dart';
import 'package:lector_qr/utils/utilis.dart';

import 'package:provider/provider.dart';

import 'package:lector_qr/providers/scan_list_provider.dart';

class ScanList extends StatelessWidget {
  final String tipo;
  const ScanList({super.key, required this.tipo});

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
          leading: tipo == 'http'
              ? Icon(
                  Icons.home_max_outlined,
                  color: Theme.of(context).primaryColor,
                )
              : Icon(
                  Icons.map_outlined,
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
          onTap: (() => urlLauncher(context, scans[index])),
        ),
      ),
    );
  }
}
