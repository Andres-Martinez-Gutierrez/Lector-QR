import 'package:flutter/cupertino.dart';

import 'package:lector_qr/providers/db_provider.dart';

class ScanListProvider extends ChangeNotifier {
  List<ScanModel> scans = [];
  String tipoSeleccionado = 'http';

  Future <ScanModel>nuevoScan(String valor) async {
    final nuevoScan = ScanModel(valor: valor);
    final id = await DBProvider.db.nuevoScan(nuevoScan);

    // Asignar el ID de la base de datos al modelo
    nuevoScan.id = id;
    if (tipoSeleccionado == nuevoScan.tipo) {
      scans.add(nuevoScan);
      notifyListeners();
    }
    return nuevoScan;
  }

  cargarScans() async {
    final scan = await DBProvider.db.getTodosScans();
    scans = [...scan!];
    notifyListeners();
  }

  cargarScanPorTipo(String tipo) async {
    final scan = await DBProvider.db.getScansPorTipo(tipo);
    scans = [...scan!];
    tipoSeleccionado = tipo;
    notifyListeners();
  }

  borrarTodos() async {
    await DBProvider.db.deleteAllScans();
    scans = [];
    notifyListeners();
  }

  borrarScanPorId(int id) async {
    scans.removeWhere((scan) => scan.id == id);
    await DBProvider.db.deleteScan(id);
    notifyListeners();
  }
}
