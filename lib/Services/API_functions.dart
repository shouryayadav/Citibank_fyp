import 'package:citi2/Models/Company_News_Details.dart';
import 'package:http/http.dart' as http;
import 'package:citi2/Models/marketNews.dart';
import 'package:citi2/Constants/strings.dart';
import 'package:citi2/Models/company_info.dart';
import 'dart:convert';
import 'package:citi2/Models/price_tick.dart';
import 'package:interactive_chart/interactive_chart.dart';


class API_functions {
  Future<MarketNews> getNews() async {
    var client = http.Client();
    var marketNews;

    try {var response = await client.get(Uri.parse(NewsString.GOOGL_news));
    if(response.statusCode==200){
      var jsonString = response.body;
      var jsonMap = json.decode(jsonString);

      marketNews = MarketNews.fromJson(jsonMap);
    }} catch(Exception){
      return marketNews;
    }
    return marketNews;
  }

  Future<CompanyInfo> getInfo() async {
    var client = http.Client();
    var companyInfo;

    try {var response = await client.get(Uri.parse(InfoString.GOOGL_info));
    if(response.statusCode==200){
      print(response.body.isEmpty);
      var jsonString = response.body;
      var jsonMap = json.decode(jsonString);

      companyInfo = CompanyInfo.fromJson(jsonMap[0]);
    }} catch(Exception){
      print(Exception.toString());
      return companyInfo;
    }
    return companyInfo;
  }

  Future<PriceTick> getTick() async {
    var client = http.Client();
    var priceTick;

    try {var response = await client.get(Uri.parse(TickerString.GOOGL_tick));
    if(response.statusCode==200){
      var jsonString = response.body;
      var jsonMap = json.decode(jsonString);

      priceTick = PriceTick.fromJson(jsonMap);
    }} catch(Exception){
      print(Exception);
      return priceTick;
    }      
    return priceTick;
  }

Future<MarketNewsDetailed> getNewsDet() async {
    var client = http.Client();
    var marketNews;

    try {var response = await client.get(Uri.parse(NewsDetailed.GOOGL_news));
    if(response.statusCode==200){
      var jsonString = response.body;
      var jsonMap = json.decode(jsonString);

      marketNews = MarketNews.fromJson(jsonMap);
    }} catch(Exception){
      return marketNews;
    }
    return marketNews;
  }
  
}