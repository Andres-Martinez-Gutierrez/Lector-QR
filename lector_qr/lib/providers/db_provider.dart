import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'package:lector_qr/models/scan_model.dart';
export 'package:lector_qr/models/scan_model.dart';

class DBProvider {
  //Propiedad estatica
  static Database? _database;

  //Instancia de la clase para crear el singelton con constructor privado
  static final DBProvider db = DBProvider._();

  //Constructor privado para siempre obtener la misma instancia de la BD
  DBProvider._();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await InitDB();

    return _database!;
  }

  Future<Database> InitDB() async {
    //Path de donde se almacenara la Base de datos
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'ScansDB.db');
    print(path);

    //Crear base de datos
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (db, version) async {
        await db.execute('''
        CREATE TABLE Scans(
          id INTEGER PRIMARY KEY,
          tipo TEXT,
          valor TEXT
          )
        ''');
      },
    );
  }

//Primer Metodo para insertar datos
  Future<int> nuevoScanRaw(ScanModel nuevoScan) async {
    final id = nuevoScan.id;
    final tipo = nuevoScan.tipo;
    final valor = nuevoScan.valor;

    //Verificar si esta lista la base de datos
    final db = await database;

    final res = await db.rawInsert('''
      INSERT INTO Scans (id, tipo, valor) 
      VALUES ($id, '$tipo', '$valor')
  
    ''');
    return res;
  }

//Primer Metodo para insertar datos
  Future<int> nuevoScan(ScanModel nuevoScan) async {
    //Verificar si esta lista la base de datos
    final db = await database;

    final res = await db.insert('Scans', nuevoScan.toJson());

    //ID del último registro insertado
    return res;
  }
}
