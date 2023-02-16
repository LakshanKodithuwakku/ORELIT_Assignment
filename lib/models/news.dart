class NewsModel {
  final String content;
  final String author;
  final String imageUrl;

  NewsModel(
      {required this.content, required this.author, required this.imageUrl});

  factory NewsModel.fromJson(dynamic json) {
    return NewsModel(
        content: json['content'] as String,
        author: json['author'] as String,
        imageUrl: json['imageUrl'] as String);
  }

  static List<NewsModel> newsFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return NewsModel.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Recipe {name: $content, image: $author, totalTime: $imageUrl}';
  }
}
