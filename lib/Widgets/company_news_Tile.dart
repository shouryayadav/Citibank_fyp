import 'package:citi2/Models/company_info.dart';
import 'package:citi2/Models/marketNews.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:citi2/Services/API_functions.dart';
import 'package:url_launcher/url_launcher.dart';


class NewsTile extends StatefulWidget {
  const NewsTile({
    Key key,
    String Stock
  }) : super(key: key);


  @override
  State<NewsTile> createState() => _newsTileState();
}

class _newsTileState extends State<NewsTile> {

  Future<MarketNews> _marketNews;

  @override
  void initState() {
    _marketNews = API_functions().getNews();
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height* 0.4,
        width: MediaQuery.of(context).size.width * 0.25,
        // uncomment when presentation
        child: FutureBuilder<MarketNews>(
          future: _marketNews,
          builder: (context, snapshot){
            if(snapshot.hasData){
              return ListView.builder(itemCount: snapshot.data.data.length , itemBuilder: (context, index){
                var newsTile = snapshot.data.data[index];
                return ListTile(title: Text(newsTile.title, style: TextStyle(color: Colors.white, fontSize: 15),),trailing: Container(width: 20, child: Image.network(newsTile.imageUrl, fit: BoxFit.contain)),onTap: () => setState(() {
                  _launchURL(newsTile.url);
                }));
              });
            }
            else{
              return Center(child: Container(height: 20,width:20, child: CircularProgressIndicator(color: Colors.amber,)));
            }
          },

        )

    );}
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