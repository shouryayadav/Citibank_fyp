// To parse this JSON data, do
//
//     final marketNews = marketNewsFromJson(jsonString);

import 'dart:convert';

MarketNews marketNewsFromJson(String str) => MarketNews.fromJson(json.decode(str));

String marketNewsToJson(MarketNews data) => json.encode(data.toJson());

class MarketNews {
  MarketNews({
    this.meta,
    this.data,
  });

  Meta meta;
  List<Datum> data;

  factory MarketNews.fromJson(Map<String, dynamic> json) => MarketNews(
    meta: Meta.fromJson(json["meta"]),
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "meta": meta.toJson(),
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.uuid,
    this.title,
    this.description,
    this.keywords,
    this.snippet,
    this.url,
    this.imageUrl,
    this.language,
    this.publishedAt,
    this.source,
    this.relevanceScore,
    this.entities,
    this.similar,
  });

  String uuid;
  String title;
  String description;
  String keywords;
  String snippet;
  String url;
  String imageUrl;
  String language;
  DateTime publishedAt;
  String source;
  dynamic relevanceScore;
  List<Entity> entities;
  List<Datum> similar;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    uuid: json["uuid"],
    title: json["title"],
    description: json["description"],
    keywords: json["keywords"],
    snippet: json["snippet"],
    url: json["url"],
    imageUrl: json["image_url"],
    language: json["language"],
    publishedAt: DateTime.parse(json["published_at"]),
    source: json["source"],
    relevanceScore: json["relevance_score"],
    entities: List<Entity>.from(json["entities"].map((x) => Entity.fromJson(x))),
    similar: json["similar"] == null ? null : List<Datum>.from(json["similar"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "uuid": uuid,
    "title": title,
    "description": description,
    "keywords": keywords,
    "snippet": snippet,
    "url": url,
    "image_url": imageUrl,
    "language": language,
    "published_at": publishedAt.toIso8601String(),
    "source": source,
    "relevance_score": relevanceScore,
    "entities": List<dynamic>.from(entities.map((x) => x.toJson())),
    "similar": similar == null ? null : List<dynamic>.from(similar.map((x) => x.toJson())),
  };
}

class Entity {
  Entity({
    this.symbol,
    this.name,
    this.exchange,
    this.exchangeLong,
    this.country,
    this.type,
    this.industry,
    this.matchScore,
    this.sentimentScore,
    this.highlights,
  });

  String symbol;
  String name;
  String exchange;
  String exchangeLong;
  String country;
  String type;
  String industry;
  double matchScore;
  double sentimentScore;
  List<Highlight> highlights;

  factory Entity.fromJson(Map<String, dynamic> json) => Entity(
    symbol: json["symbol"],
    name: json["name"],
    exchange: json["exchange"],
    exchangeLong: json["exchange_long"],
    country: json["country"],
    type: json["type"],
    industry: json["industry"],
    matchScore: json["match_score"].toDouble(),
    sentimentScore: json["sentiment_score"].toDouble(),
    highlights: List<Highlight>.from(json["highlights"].map((x) => Highlight.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "symbol": symbol,
    "name": name,
    "exchange": exchange,
    "exchange_long": exchangeLong,
    "country": country,
    "type": type,
    "industry": industry,
    "match_score": matchScore,
    "sentiment_score": sentimentScore,
    "highlights": List<dynamic>.from(highlights.map((x) => x.toJson())),
  };
}

class Highlight {
  Highlight({
    this.highlight,
    this.sentiment,
    this.highlightedIn,
  });

  String highlight;
  double sentiment;
  HighlightedIn highlightedIn;

  factory Highlight.fromJson(Map<String, dynamic> json) => Highlight(
    highlight: json["highlight"],
    sentiment: json["sentiment"].toDouble(),
    highlightedIn: highlightedInValues.map[json["highlighted_in"]],
  );

  Map<String, dynamic> toJson() => {
    "highlight": highlight,
    "sentiment": sentiment,
    "highlighted_in": highlightedInValues.reverse[highlightedIn],
  };
}

enum HighlightedIn { MAIN_TEXT, TITLE }

final highlightedInValues = EnumValues({
  "main_text": HighlightedIn.MAIN_TEXT,
  "title": HighlightedIn.TITLE
});

class Meta {
  Meta({
    this.found,
    this.returned,
    this.limit,
    this.page,
  });

  int found;
  int returned;
  int limit;
  int page;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    found: json["found"],
    returned: json["returned"],
    limit: json["limit"],
    page: json["page"],
  );

  Map<String, dynamic> toJson() => {
    "found": found,
    "returned": returned,
    "limit": limit,
    "page": page,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
