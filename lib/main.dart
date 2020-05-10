import 'package:demo_corona/screens/firstscreen.dart';
import 'package:demo_corona/screens/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Demo"),
        centerTitle: true,
        titleSpacing: 1.2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              "Shaed Prefrenced Demo ",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
            ),
            Center(
              child: Container(
                child: RaisedButton(
                  onPressed: () async {
                    bool visitingFlag = await getVisitingFlag();
                    setVisitingFlag();
                    if (visitingFlag == true) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Home(),
                        ),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FirstTime(),
                        ),
                      );
                    }
                  },
                  child: Text("Continue"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

setVisitingFlag() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  pref.setBool("visited", true);
}

getVisitingFlag() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  bool visited = pref.getBool("visited") ?? false;
  return visited;
}
