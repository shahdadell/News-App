class SourceModel{

  String? status ;
  String? message ;
  String? code;
<<<<<<< HEAD
  List<Sources>?sources;
=======
  List<Source>?sources;
>>>>>>> origin/master

  SourceModel({
    this.status,
    this.message,
    this.code,
    this.sources
  });

  factory SourceModel.fromJason(Map < String , dynamic > json) {
    return SourceModel(
      status: json["status"],
      message: json["message"] ?? "",
      code: json["code"] ?? "",
<<<<<<< HEAD
      sources: (json["sources"] as List).map((e) => Sources.fromJason(e)).toList(),
=======
      sources: List<Source>.from(json["sources"].map((elements) => Source.fromJason(elements)),
       ),
>>>>>>> origin/master
    );
  }


  }

<<<<<<< HEAD
class Sources{
=======
class Source{
>>>>>>> origin/master

  String? id;
  String? name;
  String? description;
  String? url;
  String? category;

<<<<<<< HEAD
  Sources({
=======
  Source({
>>>>>>> origin/master
    this.description,
    this.category,
    this.url,
    this.id,
    this.name,
  });

<<<<<<< HEAD
  factory Sources.fromJason(Map < String , dynamic > json) {
    return Sources(
=======
  factory Source.fromJason(Map < String , dynamic > json) {
    return Source(
>>>>>>> origin/master
      category: json["category"],
      description: json["description"],
      id: json["id"],
      name: json["name"],
      url: json["url"],
    );
  }
}