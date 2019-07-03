import 'package:flutter/material.dart';
import '../resources/data_provider.dart';
import '../models/model.dart';

class Home extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff2F7367),
        title: Text("DataBase Test"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          Model toAdd = Model.fromMap({
            "id": 1,
            "job": "Unemployed",
            "name": "Samfan",
          });
          int x = await dataProvider.addData(toAdd);
          print(x);
          Model fromDb = await dataProvider.fetchIndividualDetail(1);
          print("${fromDb.name}");
        },
        backgroundColor: Color(0xff2F7367),
      ),
    );
  }
}
