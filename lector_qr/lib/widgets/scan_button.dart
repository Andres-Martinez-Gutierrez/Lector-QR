import 'package:flutter/material.dart';
//import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:lector_qr/providers/scan_list_provider.dart';
import 'package:lector_qr/utils/utilis.dart';
import 'package:provider/provider.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0.0,
      child: const Icon(Icons.filter_center_focus),
      onPressed: () async {
        //String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        // '#3D8BEF', 'Cancelar', false, ScanMode.QR);
        //String barcodeScanRes = 'https://fernando-herrera.com';
        final barcodeScanRes = 'geo:45.287135,-75.920226';

        if (barcodeScanRes == '-1') {
          return;
        }

        final scanListProvider =
            Provider.of<ScanListProvider>(context, listen: false);
        final nuevoScan = await scanListProvider.nuevoScan(barcodeScanRes);
        urlLauncher(context, nuevoScan);
      },
    );
  }
}
