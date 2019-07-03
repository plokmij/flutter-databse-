import 'dart:async';
import 'data_provider.dart';
import '../models/model.dart';

class Repository {
  Source localDb = dataProvider;

  Future<List<String>> fetchAllNames() async {
    List<String> x = await localDb.fetchAllNames();
    return x;
  }

  Future<Model> fetchIndividualDetail(int id) async {
    Model x = await localDb.fetchIndividualDetail(id);

    return x;
  }

  Future<int> addData(Model model) async {
    return await localDb.addData(model);
  }
}

abstract class Source {
  Future<List<String>> fetchAllNames();
  Future<Model> fetchIndividualDetail(int id);
  Future<int> addData(Model model);
}
