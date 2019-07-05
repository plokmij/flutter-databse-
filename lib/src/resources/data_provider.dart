import 'package:database/src/models/model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'repository.dart';

class DataProvider implements Source {
  Database db;

  DataProvider() {
    init();
  }

  void init() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, "newdata.db");
    db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database newDb, int version) {
        newDb.execute("""
          CREATE TABLE Accounts(
            id INTEGER PRIMARY KEY,
            name TEXT,
            job TEXT
          )
        """);
      },
    );
  }

  @override
  Future<List<String>> fetchAllNames() async {
    // TODO: implement fetchAllNames
    final maps = await db.query(
      "Accounts",
      columns: ["name"],
    );

    List<String> names = [];

    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        names.add(maps[i]["name"]);
      }
    }
    print(names);
    return names;
  }

  @override
  Future<Model> fetchIndividualDetail(int id) async {
    // TODO: implement fetchIndividualDetail
    final maps = await db.query(
      "Accounts",
      columns: null,
      where: "id = ?",
      whereArgs: [id],
    );

    if (maps.length > 0) {
      return Model.fromDb(maps.first);
    }
    return null;
  }

  @override
  Future<int> addData(Model model) {
    // TODO: implement addData
    return db.insert(
      "Accounts",
      model.toMap(),
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );
  }
}

final dataProvider = DataProvider();
