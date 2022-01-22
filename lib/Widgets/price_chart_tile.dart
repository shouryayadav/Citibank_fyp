import 'package:citi2/Models/price_tick.dart';
import 'package:flutter/material.dart';
import 'package:interactive_chart/interactive_chart.dart';
import 'package:citi2/Services/API_functions.dart';


class PriceTile extends StatefulWidget {
  const PriceTile({
    Key key,
    String Stock
  }) : super(key: key);


  @override
  State<PriceTile> createState() => _priceTileState();
}

class _priceTileState extends State<PriceTile> {
  List<CandleData> _data = null;
  bool _darkMode = true;
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

          _data=candles(snapshot);

          return Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "\$"+price.results[price.results.length-1].c.toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.normal),
                        ),
                        Text(
                          "NASDAQ",
                          style:
                          TextStyle(color: Colors.blue, fontSize: 15),
                        )
                      ],
                    ),
                    Text(
                      (((price.results[price.results.length-1].c-price.results[price.results.length-2].c)/price.results[price.results.length-2].c)*100).toStringAsFixed(2)+"%",
                      style: TextStyle(color: Colors.green, fontSize: 20),
                    )
                  ],
                ),
              ),
              IconButton(
                icon: Icon(
                  _showAverage ? Icons.show_chart : Icons.bar_chart_outlined,
                  color: Colors.white,
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
              Container(
                width:MediaQuery.of(context).size.width*0.3,
                height: MediaQuery.of(context).size.height*0.6,
                child: InteractiveChart(
                  /** Only [candles] is required */
                  candles: _data,
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
                  //   overlayBackgroundColor: Colors.red[900]!.withOpacity(0.6),
                  //   overlayTextStyle: TextStyle(color: Colors.red[100]),
                  //   timeLabelHeight: 32,
                  // ),
                  /** Customize axis labels */
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
                ),),

            ],
          );
        }
        else{
          print(snapshot.error);

          return Center(child: Container(height: 20,width:20, child: CircularProgressIndicator(color: Colors.amber,)));
            }
      },
    );
    
  }

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

