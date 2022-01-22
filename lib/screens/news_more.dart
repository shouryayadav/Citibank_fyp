import 'package:citi2/main.dart';
import 'package:flutter/material.dart';
import 'package:citi2/Models/price_tick.dart';

import 'package:interactive_chart/interactive_chart.dart';
import 'package:citi2/Services/API_functions.dart';
import 'package:citi2/Models/Company_News_Details.dart';
import 'package:url_launcher/url_launcher.dart';



class NewsDetailed extends StatefulWidget {
  const NewsDetailed({
    Key key,
  }) : super(key: key);



  @override
  State<NewsDetailed> createState() => _newsDetailedState();
}

class _newsDetailedState extends State<NewsDetailed> {
 

  Future<MarketNewsDetailed> _detailed;

  @override
  void initState() {
    super.initState();
    _detailed = API_functions().getNewsDet();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MarketNewsDetailed>(
      future: _detailed,
      builder: (context, snapshot){
        if(snapshot.hasData){

          return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(onPressed:   () {
            Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => MyHomePage()),
  );

          }, 
          icon: Icon(Icons.arrow_left,color: Colors.white,)),
          title: Text("Apple Inc. (AAPL) News", style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.normal),),
        ),
        body: ListView.builder(itemCount: snapshot.data.results.length , itemBuilder: (context, index){
                var newsTile = snapshot.data.results[index];
                return ListTile(title: Text(newsTile.title,),subtitle: Text(newsTile.description),trailing: Container(width: 20, child: Image.network(newsTile.imageUrl, fit: BoxFit.contain)),onTap: () => setState(() {
                  _launchURL(newsTile.articleUrl);
                }));
              })
      ),
    );

    
  }else{
    return Center(child: CircularProgressIndicator(color: Colors.amber,backgroundColor: Colors.black,));
  }}

    );
}
Future<void> _launchURL(String url) async {
    if (!await launch(
      url,
      forceSafariVC: false,
      forceWebView: false,
      headers: <String, String>{'my_header_key': 'my_header_value'},
    )) {
      throw 'Could not launch $url';
    }
  }
}

