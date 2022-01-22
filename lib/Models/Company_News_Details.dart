// To parse this JSON data, do
//
//     final marketNewsDetailed = marketNewsDetailedFromJson(jsonString);

import 'dart:convert';

MarketNewsDetailed marketNewsDetailedFromJson(String str) => MarketNewsDetailed.fromJson(json.decode(str));

String marketNewsDetailedToJson(MarketNewsDetailed data) => json.encode(data.toJson());

class MarketNewsDetailed {
    MarketNewsDetailed({
        this.results,
        this.status,
        this.requestId,
        this.count,
        this.nextUrl,
    });

    List<Result> results;
    String status;
    String requestId;
    int count;
    String nextUrl;

    factory MarketNewsDetailed.fromJson(Map<String, dynamic> json) => MarketNewsDetailed(
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        status: json["status"],
        requestId: json["request_id"],
        count: json["count"],
        nextUrl: json["next_url"],
    );

    Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "status": status,
        "request_id": requestId,
        "count": count,
        "next_url": nextUrl,
    };
}

class Result {
    Result({
        this.id,
        this.publisher,
        this.title,
        this.author,
        this.publishedUtc,
        this.articleUrl,
        this.tickers,
        this.ampUrl,
        this.imageUrl,
        this.description,
        this.keywords,
    });

    String id;
    Publisher publisher;
    String title;
    String author;
    DateTime publishedUtc;
    String articleUrl;
    List<String> tickers;
    String ampUrl;
    String imageUrl;
    String description;
    List<String> keywords;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        publisher: Publisher.fromJson(json["publisher"]),
        title: json["title"],
        author: json["author"],
        publishedUtc: DateTime.parse(json["published_utc"]),
        articleUrl: json["article_url"],
        tickers: List<String>.from(json["tickers"].map((x) => x)),
        ampUrl: json["amp_url"] == null ? null : json["amp_url"],
        imageUrl: json["image_url"],
        description: json["description"] == null ? null : json["description"],
        keywords: json["keywords"] == null ? null : List<String>.from(json["keywords"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "publisher": publisher.toJson(),
        "title": title,
        "author": author,
        "published_utc": publishedUtc.toIso8601String(),
        "article_url": articleUrl,
        "tickers": List<dynamic>.from(tickers.map((x) => x)),
        "amp_url": ampUrl == null ? null : ampUrl,
        "image_url": imageUrl,
        "description": description == null ? null : description,
        "keywords": keywords == null ? null : List<dynamic>.from(keywords.map((x) => x)),
    };
}

class Publisher {
    Publisher({
        this.name,
        this.homepageUrl,
        this.logoUrl,
        this.faviconUrl,
    });

    String name;
    String homepageUrl;
    String logoUrl;
    String faviconUrl;

    factory Publisher.fromJson(Map<String, dynamic> json) => Publisher(
        name: json["name"],
        homepageUrl: json["homepage_url"],
        logoUrl: json["logo_url"],
        faviconUrl: json["favicon_url"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "homepage_url": homepageUrl,
        "logo_url": logoUrl,
        "favicon_url": faviconUrl,
    };
}
