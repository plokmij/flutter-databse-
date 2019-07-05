import 'package:flutter/material.dart';
import '../resources/data_provider.dart';
import '../models/model.dart';

class Home extends StatelessWidget {
  final TextEditingController _id = TextEditingController();
  final TextEditingController _job = TextEditingController();
  final TextEditingController _name = TextEditingController();

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
      body: Center(
        child: Column(
          children: <Widget>[
            Spacer(),
            InkWell(
              onTap: () {
                _showDialog(context);
              },
              child: Material(
                //elevation: -40.0,
                child: Container(
                  padding: EdgeInsets.all(45),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(9),
                    ),
                    gradient: LinearGradient(
                      colors: [
                        Colors.yellow,
                        Colors.green,
                      ],
                    ),
                  ),
                  child: Text(
                    "Add Data",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            Spacer(),
            InkWell(
              onTap: () {
                print("Tapped");
              },
              child: Material(
                //elevation: 40.0,
                child: Container(
                  padding: EdgeInsets.all(45),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(9),
                    ),
                    gradient: LinearGradient(
                      colors: [
                        Colors.yellow,
                        Colors.red,
                      ],
                    ),
                  ),
                  child: Text(
                    "ListData",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Enter Details"),
            content: Container(
              height: MediaQuery.of(context).size.height / 2.4,
              child: Column(
                children: <Widget>[
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "id",
                    ),
                    controller: _id,
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "Name",
                    ),
                    controller: _name,
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "Job",
                    ),
                    controller: _job,
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text("ADD"),
                onPressed: () async {
                  FocusScope.of(context).requestFocus(FocusNode());
                  print("ID = " + _id.text);
                  print("Job = " + _job.text);
                  print("Name = " + _name.text);

                  Map<String, dynamic> toAdd = {
                    "id": int.parse(_id.text),
                    "job": _job.text,
                    "name": _name.text
                  };
                  Model sherikkumAdd = Model.fromMap(toAdd);
                  int x = await dataProvider.addData(sherikkumAdd);
                  Model fromDb = await dataProvider.fetchIndividualDetail(toAdd["id"]);
                  print("${fromDb.name}");
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }
}
