class CategoryModel {
  String name;
  String summary;

  CategoryModel({this.name, this.summary});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    summary = json['summary'];
  }
}
