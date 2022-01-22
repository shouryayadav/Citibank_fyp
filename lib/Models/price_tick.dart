// To parse this JSON data, do
//
//     final priceTick = priceTickFromJson(jsonString);

import 'dart:convert';

PriceTick priceTickFromJson(String str) => PriceTick.fromJson(json.decode(str));

String priceTickToJson(PriceTick data) => json.encode(data.toJson());

class PriceTick {
    PriceTick({
        this.ticker,
        this.queryCount,
        this.resultsCount,
        this.adjusted,
        this.results,
        this.status,
        this.requestId,
        this.count,
    });

    String ticker;
    int queryCount;
    int resultsCount;
    bool adjusted;
    List<Result> results;
    String status;
    String requestId;
    int count;

    factory PriceTick.fromJson(Map<String, dynamic> json) => PriceTick(
        ticker: json["ticker"],
        queryCount: json["queryCount"],
        resultsCount: json["resultsCount"],
        adjusted: json["adjusted"],
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        status: json["status"],
        requestId: json["request_id"],
        count: json["count"],
    );

    Map<String, dynamic> toJson() => {
        "ticker": ticker,
        "queryCount": queryCount,
        "resultsCount": resultsCount,
        "adjusted": adjusted,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "status": status,
        "request_id": requestId,
        "count": count,
    };
}

class Result {
    Result({
        this.v,
        this.vw,
        this.o,
        this.c,
        this.h,
        this.l,
        this.t,
        this.n,
    });

    int v;
    double vw;
    double o;
    double c;
    double h;
    double l;
    int t;
    int n;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        v: json["v"],
        vw: json["vw"].toDouble(),
        o: json["o"].toDouble(),
        c: json["c"].toDouble(),
        h: json["h"].toDouble(),
        l: json["l"].toDouble(),
        t: json["t"],
        n: json["n"],
    );

    Map<String, dynamic> toJson() => {
        "v": v,
        "vw": vw,
        "o": o,
        "c": c,
        "h": h,
        "l": l,
        "t": t,
        "n": n,
    };
}
