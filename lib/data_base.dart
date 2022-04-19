import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'boost_model.dart';

class BoostDatabase {
  static final BoostDatabase instance = BoostDatabase._init();

  static Database? _database;

  BoostDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('resumes.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT';
    const integerType = 'INTEGER';

    await db.execute('''
CREATE TABLE $boostTable ( 
  ${BoostFields.id} $idType, 
  ${BoostFields.name} $textType,
  ${BoostFields.age} $integerType
 
  )
''');
  }

  Future<BoostModel> create(BoostModel boost) async {
    final db = await instance.database;
    final id = await db.insert(boostTable, boost.toJson());
    return boost.copy(id: id);
  }

  Future<List<BoostModel>> readAllNotes() async {
    final db = await instance.database;

    // final orderBy = '${ResumeFields.time} ASC';
    // final result =
    //     await db.rawQuery('SELECT * FROM $tableNotes ORDER BY $orderBy');

    final result = await db.query(boostTable);
    return result.map((json) => BoostModel.fromJson(json)).toList();
  }
}
