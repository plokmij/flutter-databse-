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
    final path = join(documentsDirectory.path, "data.db");
    db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database newDb, int version) {
        newDb.execute("""
          CREATE TABLE Accounts(
            id INTEGER PRIMARY KEY,
            name TEXT,
            job TEXT,
          )
        """);
      },
    );
  }

  @override
  Future<List<String>> fetchAllNames() async{
    // TODO: implement fetchAllNames
    final maps = await db.query(
      "Accounts",
      columns: ["name"],
    );

    if(maps.length > 0){
      print(maps.first);
    }
    return null;
  }

  @override
  Future<Model> fetchIndividualDetail(int id) {
    // TODO: implement fetchIndividualDetail
    return null;
  }
}
