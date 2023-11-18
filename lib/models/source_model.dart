class SourceModel{

  String? status ;
  String? message ;
  String? code;
  List<Source>?sources;

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
      sources: List<Source>.from(json["sources"].map((elements) => Source.fromJason(elements)),
       ),
    );
  }


  }

class Source{

  String? id;
  String? name;
  String? description;
  String? url;
  String? category;

  Source({
    this.description,
    this.category,
    this.url,
    this.id,
    this.name,
  });

  factory Source.fromJason(Map < String , dynamic > json) {
    return Source(
      category: json["category"],
      description: json["description"],
      id: json["id"],
      name: json["name"],
      url: json["url"],
    );
  }
}