import 'package:flutter/material.dart';
void main() {
  runApp(MyApp2());
}

class MyApp2 extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp2> {
  String msg = 'Flutter RaisedButton Example';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Environmental Impacts'),
        ),

        body: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              new Container(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Environmental Impacts:', style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic),),
                      RaisedButton(
                        child: Text("Carbon Monoxide", style: TextStyle(fontSize: 20),),
                        onPressed: _changeText,
                        color: Colors.red,
                        textColor: Colors.yellow,
                        padding: EdgeInsets.all(8.0),
                        splashColor: Colors.grey,
                      ),
                      RaisedButton(
                        child: Text("Nitrogen Dioxide", style: TextStyle(fontSize: 20),),
                        onPressed: _changeText,
                        color: Colors.red,
                        textColor: Colors.yellow,
                        padding: EdgeInsets.all(8.0),
                        splashColor: Colors.grey,
                      ),
                      Text('Ozon Layer:', style: TextStyle(fontSize: 15, fontStyle: FontStyle.italic),),
                      RaisedButton(
                        child: Text("1.World View", style: TextStyle(fontSize: 20),),
                        onPressed: _changeText,
                        color: Colors.red,
                        textColor: Colors.yellow,
                        padding: EdgeInsets.all(8.0),
                        splashColor: Colors.grey,
                      ),
                      RaisedButton(
                        child: Text("2.Sample Highlight: Video", style: TextStyle(fontSize: 20),),
                        onPressed: _changeText,
                        color: Colors.red,
                        textColor: Colors.yellow,
                        padding: EdgeInsets.all(8.0),
                        splashColor: Colors.grey,
                      ),
                      Text('Water Quality:', style: TextStyle(fontSize: 15, fontStyle: FontStyle.italic),),
                      RaisedButton(
                        child: Text("Sea Surface temperature", style: TextStyle(fontSize: 20),),
                        onPressed: _changeText,
                        color: Colors.red,
                        textColor: Colors.yellow,
                        padding: EdgeInsets.all(8.0),
                        splashColor: Colors.grey,
                      ),
                      RaisedButton(
                        child: Text("Land Surface temperature", style: TextStyle(fontSize: 20),),
                        onPressed: _changeText,
                        color: Colors.red,
                        textColor: Colors.yellow,
                        padding: EdgeInsets.all(8.0),
                        splashColor: Colors.grey,
                      ),
                      // RaisedButton(
                      //   child: Text("1.Groundwater: image", style: TextStyle(fontSize: 20),),
                      //   onPressed: _changeText,
                      //   color: Colors.red,
                      //   textColor: Colors.yellow,
                      //   padding: EdgeInsets.all(8.0),
                      //   splashColor: Colors.grey,
                      // ),
                    ],

                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  _changeText() {
    setState(() {
      if (msg.startsWith('F')) {
        msg = 'We have learned FlutterRaised button example.';
      } else {
        msg = 'Flutter RaisedButton Example';
      }
    });
  }
}