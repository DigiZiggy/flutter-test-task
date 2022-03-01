class Article {
  String id;
  String title;
  String type;
  String source;
  String instrumentId;
  List relatedInstrumentIds;
  String url;
  String imageUrl;
  String publishTime;
  String sentiment;
  String origin;
  String state;
  String lastModified;
  String createTime;

  Article({
    required this.id,
    required this.title,
    required this.type,
    required this.source,
    required this.instrumentId,
    required this.relatedInstrumentIds,
    required this.url,
    required this.imageUrl,
    required this.publishTime,
    required this.sentiment,
    required this.origin,
    required this.state,
    required this.lastModified,
    required this.createTime
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['id'],
      title: json['title'],
      type: json['type'],
      source: json['source'],
      instrumentId: json['instrumentId'],
      relatedInstrumentIds: json['relatedInstrumentIds'],
      url: json['url'],
      imageUrl: json['imageUrl'],
      publishTime: json['publishTime'],
      sentiment: json['sentiment'],
      origin: json['origin'],
      state: json['state'],
      lastModified: json['lastModified'],
      createTime: json['createTime'],
    );
  }
}