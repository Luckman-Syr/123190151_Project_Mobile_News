import 'nertwork_base.dart';

class NewsDataCategory {
  static NewsDataCategory instance = NewsDataCategory();
  Future<Map<String, dynamic>> loadData(id) {
    return BaseNetwork.get(
        "top-headlines?country=${id}&apiKey=e6964718c9a84044bb5012792856fcd5");
  }

  Future<Map<String, dynamic>> loadDataSource(id) {
    return BaseNetwork.get(
        "top-headlines?category=${id}&apiKey=e6964718c9a84044bb5012792856fcd5");
  }

  Future<Map<String, dynamic>> loadDataCategory(id, id2) {
    return BaseNetwork.get(
        "top-headlines?country=${id}&category=${id2}&apiKey=e6964718c9a84044bb5012792856fcd5");
  }
}
