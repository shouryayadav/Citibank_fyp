import 'dart:ui';

import 'package:citi2/Models/company_info.dart';
import 'package:citi2/Models/marketNews.dart';
import 'package:citi2/screens/price_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:citi2/Services/API_functions.dart';
import 'package:http/http.dart';
import 'package:citi2/Widgets/Company_Info_Tile.dart';
import 'package:citi2/Widgets/company_news_Tile.dart';
import 'package:citi2/Widgets/price_chart_tile.dart';
import 'package:sliding_sheet/sliding_sheet.dart';
import 'package:citi2/screens/news_more.dart';


class MarketsTile extends StatefulWidget {
  const MarketsTile({
    Key key,
  }) : super(key: key);


  @override
  State<MarketsTile> createState() => _marketsTileState();
}

class _marketsTileState extends State<MarketsTile> {
  



  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(width: MediaQuery.of(context).size.width*0.025,),
                IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios, color: Colors.white,)),
                TextButton(onPressed: (){},  child: Text(
                  "Markets",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),),
                Text(
                  " / ",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                TextButton(onPressed: (){},  child: Text(
                  "North America",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),),
                Text(
                  " / ",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                TextButton(onPressed: (){},  child: Text(
                  "NASDAQ",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),),
                Text(
                  " / ",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                TextButton(onPressed: (){
                  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => PriceChart()),
  );
                },  child: Text(
                  "Alphabet Inc.",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    PriceTile(),
                    // SvgPicture.asset(
                    //   'assets/images/marketData.svg',
                    //   height: 500,
                    // ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "Triggers",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.normal),
                            ),
                            TextButton(
                                onPressed: () => {},
                                child: Text(
                                  'more',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10),
                                ))
                          ]),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/images/Rings.svg',
                                height: MediaQuery.of(context).size.height * 0.15,
                                width: MediaQuery.of(context).size.width * 0.15,
                              ),
                              Text(
                                "Trigger A",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 10),
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/images/Rings.svg',
                                height: MediaQuery.of(context).size.height * 0.15,
                                width: MediaQuery.of(context).size.width * 0.15,
                              ),
                              Text(
                                "Market Trigger",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 10),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Signals & News",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.normal),
                          ),
                          TextButton(
                              onPressed: () => {Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => NewsDetailed()),
  )},
                              child: Text(
                                'more',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 10),
                              )),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),

                     NewsTile(),


                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    InfoTile(),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: showAsBottomSheet,
                      style: ElevatedButton.styleFrom(primary: Colors.black),
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("1 Trigger Found",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.error_rounded,
                              color: Colors.black,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextButton(
                        onPressed: () => {Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => PriceChart()),
  )},
                        child: Text("Technical Analysis",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ))),
                    Divider(
                      color: Colors.white,
                    ),
                    TextButton(
                        onPressed: () => {},
                        child: Text("Fundamental Analysis",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ))),
                    Divider(
                      color: Colors.white,
                    ),
                    TextButton(
                        onPressed: () => {},
                        child: Text("Social Sentiment Analysis",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ))),
                    Divider(
                      color: Colors.white,
                    ),
                  ],
                )
              ],
            ),
          ]),
    );
  }
  void showAsBottomSheet() async {
  final result = await showSlidingBottomSheet(
    context,
    builder: (context) {
      return SlidingSheetDialog(
        color: Colors.black54,
        elevation: 8,
        cornerRadius: 16,
        snapSpec: const SnapSpec(
          snap: true,
          snappings: [0.4, 0.7, 1.0],
          positioning: SnapPositioning.relativeToAvailableSpace,
        ),
        builder: (context, state) {
          return Container(
            height: 300,
            width: MediaQuery.of(context).size.width,
            child: Material(
              color: Color(0xff0b0b0e),
              child: Column(mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                Row(
                  children: [SizedBox(width: MediaQuery.of(context).size.width*0.05,),
                    Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text("My Portfolio & Watchlist Upates", style: TextStyle(color: Colors.white, fontSize: 25),),
                    IconButton(onPressed: () => Navigator.pop(context, 'This is the result.'), icon: Icon(Icons.arrow_downward, color: Colors.white,))],
                    ),
                  ],
                ),
                SizedBox(height:20),
                Row(
                  children: [SizedBox(width: MediaQuery.of(context).size.width*0.05,),
                    GestureDetector(
                      onTap: (){Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => PriceChart()),
  );},
                      child: Container(
                        child: Column( mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                          children: [Text("Inverse Head & Shoulders Pattern Detected in GOOGL", style: TextStyle(color: Colors.white, fontSize: 15),),
                          Container(height:200,width: 200,child: Image.asset("/images/pattern.png",fit: BoxFit.contain,))]
                        ),
                      ),
                    ),
                  ],
                ),
                
              ],),
            )
            
          );
        },
      );
    }
  );

  print(result); // This is the result.
}
}
