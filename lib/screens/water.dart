import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
void main() {
  runApp(MyApp4());
}

class MyApp4 extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp4> {
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
                      RaisedButton(
                        child: Text("Precipitation", style: TextStyle(fontSize: 20),),
                        onPressed: (){Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => YourWebView("https://worldview.earthdata.nasa.gov/?v=-362.2604272674871,-163.03038833057283,315.81489746528064,118.92186968422371&l=IMERG_Precipitation_Rate,Reference_Labels_15m(hidden),Reference_Features_15m(hidden),Coastlines_15m,VIIRS_SNPP_CorrectedReflectance_TrueColor(hidden),MODIS_Aqua_CorrectedReflectance_TrueColor(hidden),MODIS_Terra_CorrectedReflectance_TrueColor(hidden)&lg=false&t=2021-10-01-T17%3A09%3A59Z")));},
                        color: Colors.red,
                        textColor: Colors.yellow,
                        padding: EdgeInsets.all(8.0),
                        splashColor: Colors.grey,
                      ),
                      RaisedButton(
                        child: Text("Groundwater: image", style: TextStyle(fontSize: 20),),
                        onPressed: (){Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => YourWebView("https://cdn.earthdata.nasa.gov/conduit/upload/12754/GraceMean.jpg")));},
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