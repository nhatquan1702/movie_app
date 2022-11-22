class GenreData {
  final int? id;
  final String? name;

  GenreData(
      this.id,
      this.name,
      );

  GenreData.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class GenreList {
  List<GenreData>? listGenre;
  String? error;

  GenreList(this.listGenre, this.error);

  GenreList.fromJson(Map<String, dynamic> json)
      : listGenre =
  (json["genres"] as List).map((i) => GenreData.fromJson(i)).toList(),
        error = "";

  GenreList.withError(String errorValue)
      : listGenre = [],
        error = errorValue;
}

