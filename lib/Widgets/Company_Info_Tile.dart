import 'package:citi2/Models/company_info.dart';
import 'package:citi2/Models/marketNews.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:citi2/Services/API_functions.dart';

class InfoTile extends StatefulWidget {
  const InfoTile({
    Key key,
    String Stock
  }) : super(key: key);


  @override
  State<InfoTile> createState() => _infoTileState();
}

class _infoTileState extends State<InfoTile> {

  Future<CompanyInfo> _companyInfo;
  @override
  void initState() {
    _companyInfo = API_functions().getInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<CompanyInfo>(
      future: _companyInfo,
      builder: (context,snapshot){
        if(snapshot.hasData){
          var infoTile = snapshot.data;
          return Column(children: [
            Text(
              infoTile.companyName+ " (" + infoTile.symbol+")",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.normal),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.3,
              child: Text(
                infoTile.description,
                style: TextStyle(color: Colors.white, fontSize: 15),
                textAlign: TextAlign.end,
              ),
            ),
          ]);
        }
        else {
          return CircularProgressIndicator(color: Colors.amber,);}
      },

    );}
}