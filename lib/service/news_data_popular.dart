import 'nertwork_base.dart';

class NewsDataPopular {
  static NewsDataPopular instance = NewsDataPopular();
  Future<Map<String, dynamic>> loadData() {
    return BaseNetwork.get(
        "top-headlines?country=us&apiKey=e6964718c9a84044bb5012792856fcd5");
  }
}
