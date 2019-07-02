class Model {
  final int id;
  final String name;
  final String job;

  Model.fromDb(Map<String, dynamic> parsedJson)
      : id = parsedJson["id"],
        name = parsedJson["name"],
        job = parsedJson["job"];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "id": id,
      "name": name,
      "job": job,
    };
  }
}
