class CategoryInCountry {
  String? name;
  String? id;
  int click;

  CategoryInCountry({this.name, this.id, required this.click});
}

List<CategoryInCountry> getSpesifikCategory() {
  return [
    CategoryInCountry(id: "all", name: "All", click: 1),
    CategoryInCountry(id: "business", name: "Business", click: 0),
    CategoryInCountry(id: "entertainment", name: "Entertainment", click: 0),
    CategoryInCountry(id: "health", name: "Health", click: 0),
    CategoryInCountry(id: "science", name: "Science", click: 0),
    CategoryInCountry(id: "sports", name: "Sports", click: 0),
    CategoryInCountry(id: "technology", name: "Technology", click: 0)
  ];
}
