// class News {
//   String? status;
//   int? totalResults;
//   List<Articles>? articles;

//   News({
//     this.status,
//     this.totalResults,
//     this.articles,
//   });

//   News.fromJson(Map<String, dynamic> json) {
//     status = json['status'] as String?;
//     totalResults = json['totalResults'] as int?;
//     articles = (json['articles'] as List?)
//         ?.map((dynamic e) => Articles.fromJson(e as Map<String, dynamic>))
//         .toList();
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> json = <String, dynamic>{};
//     json['status'] = status;
//     json['totalResults'] = totalResults;
//     json['articles'] = articles?.map((e) => e.toJson()).toList();
//     return json;
//   }
// }
class ArticlesModel {
  List<Articles>? articles;
  ArticlesModel({this.articles});
  ArticlesModel.fromJson(Map<String, dynamic> json) {
    if (json['articles'] != null) {
      articles = <Articles>[];
      json['articles'].forEach((v) {
        articles!.add(new Articles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.articles != null) {
      data['articles'] = this.articles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Articles {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Articles({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  Articles.fromJson(Map<String, dynamic> json) {
    source = (json['source'] as Map<String, dynamic>?) != null
        ? Source.fromJson(json['source'] as Map<String, dynamic>)
        : null;
    author = json['author'] as String?;
    title = json['title'] as String?;
    description = json['description'] as String?;
    url = json['url'] as String?;
    urlToImage = json['urlToImage'] as String?;
    publishedAt = json['publishedAt'] as String?;
    content = json['content'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['source'] = source?.toJson();
    data['author'] = author;
    data['title'] = title;
    data['description'] = description;
    data['url'] = url;
    data['urlToImage'] = urlToImage;
    data['publishedAt'] = publishedAt;
    data['content'] = content;
    return data;
  }
}

class Source {
  String? id;
  String? name;

  Source({
    this.id,
    this.name,
  });

  Source.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String?;
    name = json['name'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['name'] = name;
    return json;
  }
}
