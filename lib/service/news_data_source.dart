import 'nertwork_base.dart';

class NewsDataSource {
  static NewsDataSource instance = NewsDataSource();
  Future<Map<String, dynamic>> loadData() {
    return BaseNetwork.get(
        "top-headlines?country=id&apiKey=e6964718c9a84044bb5012792856fcd5");
  }
}
