// To parse this JSON data, do
//
//     final companyInfo = companyInfoFromJson(jsonString);

import 'dart:convert';

CompanyInfo companyInfoFromJson(String str) => CompanyInfo.fromJson(json.decode(str));

String companyInfoToJson(CompanyInfo data) => json.encode(data.toJson());

class CompanyInfo {
  CompanyInfo({
    this.symbol,
    this.price,
    this.beta,
    this.volAvg,
    this.mktCap,
    this.lastDiv,
    this.range,
    this.changes,
    this.companyName,
    this.currency,
    this.cik,
    this.isin,
    this.cusip,
    this.exchange,
    this.exchangeShortName,
    this.industry,
    this.website,
    this.description,
    this.ceo,
    this.sector,
    this.country,
    this.fullTimeEmployees,
    this.phone,
    this.address,
    this.city,
    this.state,
    this.zip,
    this.dcfDiff,
    this.dcf,
    this.image,
    this.ipoDate,
    this.defaultImage,
    this.isEtf,
    this.isActivelyTrading,
    this.isAdr,
    this.isFund,
  });

  String symbol;
  double price;
  double beta;
  int volAvg;
  int mktCap;
  int lastDiv;
  String range;
  double changes;
  String companyName;
  String currency;
  String cik;
  String isin;
  String cusip;
  String exchange;
  String exchangeShortName;
  String industry;
  String website;
  String description;
  String ceo;
  String sector;
  String country;
  String fullTimeEmployees;
  String phone;
  String address;
  String city;
  String state;
  String zip;
  dynamic dcfDiff;
  double dcf;
  String image;
  DateTime ipoDate;
  bool defaultImage;
  bool isEtf;
  bool isActivelyTrading;
  bool isAdr;
  bool isFund;

  factory CompanyInfo.fromJson(Map<String, dynamic> json) => CompanyInfo(
    symbol: json["symbol"],
    price: json["price"].toDouble(),
    beta: json["beta"].toDouble(),
    volAvg: json["volAvg"],
    mktCap: json["mktCap"],
    lastDiv: json["lastDiv"],
    range: json["range"],
    changes: json["changes"].toDouble(),
    companyName: json["companyName"],
    currency: json["currency"],
    cik: json["cik"],
    isin: json["isin"],
    cusip: json["cusip"],
    exchange: json["exchange"],
    exchangeShortName: json["exchangeShortName"],
    industry: json["industry"],
    website: json["website"],
    description: json["description"],
    ceo: json["ceo"],
    sector: json["sector"],
    country: json["country"],
    fullTimeEmployees: json["fullTimeEmployees"],
    phone: json["phone"],
    address: json["address"],
    city: json["city"],
    state: json["state"],
    zip: json["zip"],
    dcfDiff: json["dcfDiff"],
    dcf: json["dcf"].toDouble(),
    image: json["image"],
    ipoDate: DateTime.parse(json["ipoDate"]),
    defaultImage: json["defaultImage"],
    isEtf: json["isEtf"],
    isActivelyTrading: json["isActivelyTrading"],
    isAdr: json["isAdr"],
    isFund: json["isFund"],
  );

  Map<String, dynamic> toJson() => {
    "symbol": symbol,
    "price": price,
    "beta": beta,
    "volAvg": volAvg,
    "mktCap": mktCap,
    "lastDiv": lastDiv,
    "range": range,
    "changes": changes,
    "companyName": companyName,
    "currency": currency,
    "cik": cik,
    "isin": isin,
    "cusip": cusip,
    "exchange": exchange,
    "exchangeShortName": exchangeShortName,
    "industry": industry,
    "website": website,
    "description": description,
    "ceo": ceo,
    "sector": sector,
    "country": country,
    "fullTimeEmployees": fullTimeEmployees,
    "phone": phone,
    "address": address,
    "city": city,
    "state": state,
    "zip": zip,
    "dcfDiff": dcfDiff,
    "dcf": dcf,
    "image": image,
    "ipoDate": "${ipoDate.year.toString().padLeft(4, '0')}-${ipoDate.month.toString().padLeft(2, '0')}-${ipoDate.day.toString().padLeft(2, '0')}",
    "defaultImage": defaultImage,
    "isEtf": isEtf,
    "isActivelyTrading": isActivelyTrading,
    "isAdr": isAdr,
    "isFund": isFund,
  };
}
