class AlarmContentsModel {
  String type;
  String content;
  String createdAt;
  String title;
  int read;

  AlarmContentsModel({
    this.type,
    this.title,
    this.createdAt,
    this.content,
    this.read,
  });

  AlarmContentsModel.fromJson(Map<String, dynamic> json) {
    type = json["type"];
    content = json["content"];
    createdAt = json["createdAt"];
    title = json["title"];
    read = json["read"];
  }
}
