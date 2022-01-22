import 'package:flutter/material.dart';
import 'package:citi2/screens/markets.dart';
import 'package:sliding_sheet/sliding_sheet.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Citi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: const MyHomePage(title: 'Citi Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String dropdownValue = 'HKD';

  bool showBottomMenu = false;


  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: 0);
    return Scaffold(
        backgroundColor: Colors.black,
        body: 
        SingleChildScrollView(
            child: 
            
            Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Container(
                      height: 50,
                      width: 100,
                      child: Image.asset(
                        "assets/images/logo.png",
                        fit: BoxFit.contain,
                      )),
                  Container(
                    child: Row(
                      children: [
                        Text("Currency:",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 15)),
                        SizedBox(width: 10),
                        DropdownButton<String>(
                          dropdownColor: Colors.black,
                          value: dropdownValue,
                          icon: const Icon(Icons.arrow_drop_down),
                          iconSize: 24,
                          elevation: 16,
                          style: const TextStyle(color: Colors.white),
                          underline: Container(
                            height: 2,
                            color: Colors.white,
                          ),
                          onChanged: (String newValue) {setState(() {
                            dropdownValue=newValue;
                          });},
                          items: <String>['HKD', 'USD', 'SGD', 'INR']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "Shourya Yadav",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            Text("ID:XXXXXXXX",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15)),
                          ]),
                      SizedBox(
                        width: 5,
                      ),
                    
                      Container(
                          height: 50,
                          width: 50,
                          child: CircleAvatar(
                            foregroundImage:
                                AssetImage("assets/images/user.jpg"),
                          ))
                    ]),
                  )
                ]),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                SizedBox(width: MediaQuery.of(context).size.width*0.015,),
                TextButton(
                    onPressed: () {
                      controller.animateToPage(0, duration: Duration(milliseconds: 1000), curve: Curves.easeIn);

                    },
                    child: Text('Home',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold))),
                TextButton(
                    onPressed: () {
                      controller.animateToPage(1, duration: Duration(milliseconds: 1000), curve: Curves.easeIn);

                    },
                    child: Text('My Holdings',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold))),
                TextButton(
                    onPressed: () {
                      controller.animateToPage(2, duration: Duration(milliseconds: 1000), curve: Curves.easeIn);

                    },
                    child: Text('My Watchlist',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold))),
                TextButton(
                    onPressed: () {
                      controller.animateToPage(3, duration: Duration(milliseconds: 1000), curve: Curves.easeIn);

                    },
                    child: Text('My Triggers',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold))),
                TextButton(
                    onPressed: (){
                      controller.animateToPage(4, duration: Duration(milliseconds: 1000), curve: Curves.easeIn);
                    },
                    child: Text('Markets',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)))
              ],
            ),
            SizedBox(height: 30),
            Container(
                height: MediaQuery.of(context).size.height,
                child: PageView(
                  scrollDirection: Axis.horizontal,
                  controller: controller,
                  children: const <Widget>[
                    Center(
                      child: Text(
                        'First Page',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Center(
                      child: Text('Second Page',
                          style: TextStyle(color: Colors.white)),
                    ),
                    Center(
                      child: Text('Third Page',
                          style: TextStyle(color: Colors.white)),
                    ),
                    Center(
                      child: Text('Fourth Page',
                          style: TextStyle(color: Colors.white)),
                    ),
                    Center(child: MarketsTile())
                  ],
                )),
          ],
        ),
        ),
        );
  }
  
}
