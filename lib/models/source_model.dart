class SourceModel{

  String? status ;
  String? message ;
  String? code;
  List<Sources>?sources;

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
      sources: (json["sources"] as List).map((e) => Sources.fromJason(e)).toList(),
    );
  }


  }

class Sources{

  String? id;
  String? name;
  String? description;
  String? url;
  String? category;

  Sources({
    this.description,
    this.category,
    this.url,
    this.id,
    this.name,
  });

  factory Sources.fromJason(Map < String , dynamic > json) {
    return Sources(
      category: json["category"],
      description: json["description"],
      id: json["id"],
      name: json["name"],
      url: json["url"],
    );
  }
}