import 'package:citi2/main.dart';
import 'package:flutter/material.dart';
import 'package:citi2/Models/price_tick.dart';

import 'package:interactive_chart/interactive_chart.dart';
import 'package:citi2/Services/API_functions.dart';


class PriceChart extends StatefulWidget {
  const PriceChart({
    Key key,
    String Stock
  }) : super(key: key);



  @override
  State<PriceChart> createState() => _priceChartState();
}

class _priceChartState extends State<PriceChart> {
  List<CandleData> _data = null;
  bool _showAverage = false;

Future<PriceTick> _priceTick;

  @override
  void initState() {
    super.initState();
    _priceTick = API_functions().getTick();
  }

List<CandleData> candles(AsyncSnapshot<PriceTick> _rawData) => _rawData.data.results
      .map((row) => CandleData(
    timestamp: row.t,
    open: row.o?.toDouble(),
    high: row.h?.toDouble(),
    low: row.l?.toDouble(),
    close: row.c?.toDouble(),
    volume: row.v?.toDouble(),
  ))
      .toList();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PriceTick>(
      future: _priceTick,
      builder: (context, snapshot){
        if(snapshot.hasData){
          var price = snapshot.data;

          print(price.results[0].h);

          _data= candles(snapshot);

          return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(onPressed:   () {
            Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => MyHomePage()),
  );

          }, 
          icon: Icon(Icons.chevron_left,color: Colors.white,)),
          title: Text("Alphabet Inc. (GOOGL)"),
          actions: [
            IconButton(
              icon: Icon(
                _showAverage ? Icons.show_chart : Icons.bar_chart_outlined,
              ),
              onPressed: () {
                setState(() => _showAverage = !_showAverage);
                if (_showAverage) {
                  _computeTrendLines();
                } else {
                   _removeTrendLines();
                }
              },
            ),
          ],
        ),
        body: SafeArea(

          minimum: const EdgeInsets.all(24.0),
          child: InteractiveChart(
            /** Only [candles] is required */
            candles: _data,
            style: ChartStyle(
              overlayBackgroundColor: Colors.amber,
              overlayTextStyle: TextStyle(color: Colors.black),
            ),
            /** Uncomment the following for examples on optional parameters */

            /** Example styling */
            // style: ChartStyle(
            //   priceGainColor: Colors.teal[200]!,
            //   priceLossColor: Colors.blueGrey,
            //   volumeColor: Colors.teal.withOpacity(0.8),
            //   trendLineStyles: [
            //     Paint()
            //       ..strokeWidth = 2.0
            //       ..strokeCap = StrokeCap.round
            //       ..color = Colors.deepOrange,
            //     Paint()
            //       ..strokeWidth = 4.0
            //       ..strokeCap = StrokeCap.round
            //       ..color = Colors.orange,
            //   ],
            //   priceGridLineColor: Colors.blue[200]!,
            //   priceLabelStyle: TextStyle(color: Colors.blue[200]),
            //   timeLabelStyle: TextStyle(color: Colors.blue[200]),
            //   selectionHighlightColor: Colors.red.withOpacity(0.2),
            //   overlayBackgroundColor: Colors.red[900].withOpacity(0.6),
            //   overlayTextStyle: TextStyle(color: Colors.red[100]),
            //   timeLabelHeight: 32,
            // ),
            // ** Customize axis labels */
            // timeLabel: (timestamp, visibleDataCount) => "📅",
            // priceLabel: (price) => "${price.round()} 💎",
            /** Customize overlay (tap and hold to see it)
             ** Or return an empty object to disable overlay info. */
            // overlayInfo: (candle) => {
            //   "💎": "🤚    ",
            //   "Hi": "${candle.high?.toStringAsFixed(2)}",
            //   "Lo": "${candle.low?.toStringAsFixed(2)}",
            // },
            /** Callbacks */
            // onTap: (candle) => print("user tapped on $candle"),
            // onCandleResize: (width) => print("each candle is $width wide"),
          ),
        ),
      ),
    );

    
        }

        else{
          return Container(color: Colors.black,height:MediaQuery.of(context).size.height,width: MediaQuery.of(context).size.width,child: Center(child: CircularProgressIndicator(color: Colors.amber,)));
        }

   } );}
    _computeTrendLines() {
    final ma7 = CandleData.computeMA(_data, 7);
    final ma30 = CandleData.computeMA(_data, 30);
    final ma90 = CandleData.computeMA(_data, 90);

    for (int i = 0; i < _data.length; i++) {
      _data[i].trends = [ma7[i], ma30[i], ma90[i]];
    }
  }

  _removeTrendLines() {
    for (final data in _data) {
      data.trends = [];
    }
  }
}

