import 'dart:async';
import '../models/model.dart';

abstract class Source {
  Future<List<String>> fetchAllNames();
  Future<Model> fetchIndividualDetail(int id);
  Future<int> addData(Model model);
}