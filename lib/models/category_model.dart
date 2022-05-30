class CategoryModel {
  String? name;
  String? id;

  CategoryModel({this.name, this.id});
}

List<CategoryModel> getAllCategory() {
  return [
    CategoryModel(id: "business", name: "Business"),
    CategoryModel(id: "entertainment", name: "Entertainment"),
    CategoryModel(id: "general", name: "General"),
    CategoryModel(id: "health", name: "Health"),
    CategoryModel(id: "science", name: "Science"),
    CategoryModel(id: "sports", name: "Sports"),
    CategoryModel(id: "technology", name: "Technology")
  ];
}
