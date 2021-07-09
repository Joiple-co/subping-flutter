class CategoryModel {
  String category;
  String categoryCode;
  String categorySummary;

  CategoryModel({this.category, this.categoryCode, this.categorySummary});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    categoryCode = json['categoryCode'];
    categorySummary = json['categorySummary'];
  }
}
