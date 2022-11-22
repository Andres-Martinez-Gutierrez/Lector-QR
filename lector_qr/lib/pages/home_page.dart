import 'package:flutter/material.dart';
import 'package:lector_qr/providers/scan_list_provider.dart';
import 'package:provider/provider.dart';

import 'package:lector_qr/widgets/custom_navigatorbar.dart';
import 'package:lector_qr/pages/direcciones_page.dart';
import 'package:lector_qr/pages/mapas_page.dart';

import 'package:lector_qr/providers/ui_provider.dart';

import 'package:lector_qr/widgets/scan_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: const Text('Historial'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_forever),
            onPressed: () {
              scanListProvider.borrarTodos();
            },
          ),
        ],
      ),
      body: _HomePageBody(),
      bottomNavigationBar: const CustomNavigationBar(),
      floatingActionButton: const ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Obtener el selected del menuOpt
    final uiProvider = Provider.of<UIProvider>(context);

    //Cambiar para mostrar la pagina respectiva
    final currentIndex = uiProvider.selectedMenuOpt;

    //Todo: temporal
    //final temporalScan = ScanModel(valor: 'http://google.com');
    //DBProvider.db.nuevoScan(temporalScan);
    //DBProvider.db.getScanById(21).then((scan) => print(scan!.valor));
    //DBProvider.db.getTodosScans().then( print);
    //DBProvider.db.deleteAllScans().then(print);
    final scanListProvider =
        Provider.of<ScanListProvider>(context, listen: false);

    switch (currentIndex) {
      case 0:
        scanListProvider.cargarScanPorTipo('geo');
        return MapasPage();
      case 1:
        scanListProvider.cargarScanPorTipo('http');
        return const DireccionesPage();
      default:
        return MapasPage();
    }
  }
}
