class Video {
  final String id;
  final String key;
  final String name;
  final String site;
  final String type;

  Video(this.id, this.key, this.name, this.site, this.type);

  Video.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        key = json["key"],
        name = json["name"],
        site = json["site"],
        type = json["type"];
}

class VideoList {
  final List<Video> videos;
  final String error;

  VideoList(this.videos, this.error);

  VideoList.fromJson(Map<String, dynamic> json)
      : videos =
            (json["results"] as List).map((i) => Video.fromJson(i)).toList(),
        error = "";

  VideoList.withError(String errorValue)
      : videos = [],
        error = errorValue;
}
