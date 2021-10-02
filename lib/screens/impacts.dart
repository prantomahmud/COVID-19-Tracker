import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../screens/Environment.dart';
import '../../screens/Seasonality.dart';
import '../../screens/water.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String msg = 'Flutter RaisedButton Example';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Impacts'),
        ),

        body: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
          new Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Text('Environmental Impacts:', style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic),),
                RaisedButton(
                  child: Text("Environmental Impacts", style: TextStyle(fontSize: 20),),
                  onPressed: () {
                Navigator.push(
                context, MaterialPageRoute(builder: (context) => MyApp1()));
                },
                  color: Colors.red,
                  textColor: Colors.yellow,
                  padding: EdgeInsets.all(8.0),
                  splashColor: Colors.grey,
                ),
                RaisedButton(
                  child: Text("Socioeconomic impact", style: TextStyle(fontSize: 20),),
                  onPressed: (){Navigator.push(
                      context,
                           MaterialPageRoute(builder: (context) => YourWebView("https://sedac.ciesin.columbia.edu/mapping/popest/covid-19/")));},
                  color: Colors.red,
                  textColor: Colors.yellow,
                  padding: EdgeInsets.all(8.0),
                  splashColor: Colors.grey,
                ),
                //Text('Seasonality Data:', style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),),
                RaisedButton(
                  child: Text("Seasonality Impact", style: TextStyle(fontSize: 20),),
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => MyApp3()));
                  },
                  color: Colors.red,
                  textColor: Colors.yellow,
                  padding: EdgeInsets.all(8.0),
                  splashColor: Colors.grey,
                ),
                RaisedButton(
                  child: Text("Water Availability Data", style: TextStyle(fontSize: 20),),
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => MyApp4()));
                  },
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
class YourWebView extends StatelessWidget {
  String url;
  YourWebView(this.url);

  final Completer<WebViewController> _controller =
  Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Impacts'),
        ),
        body: Builder(builder: (BuildContext context) {
          return WebView(
            initialUrl: url,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
            },
            navigationDelegate: (NavigationRequest request) {
              if (request.url.startsWith('https://www.youtube.com/')) {
                print('blocking navigation to $request}');
                return NavigationDecision.prevent;
              }
              print('allowing navigation to $request');
              return NavigationDecision.navigate;
            },
            onPageStarted: (String url) {
              print('Page started loading: $url');
            },
            onPageFinished: (String url) {
              print('Page finished loading: $url');
            },
            gestureNavigationEnabled: true,
          );
        }));
  }
}