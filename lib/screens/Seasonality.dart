import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
void main() {
  runApp(MyApp3());
}

class MyApp3 extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp3> {
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
                        child: Text("Air temperature", style: TextStyle(fontSize: 20),),
                        onPressed: (){Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => YourWebView("https://worldview.earthdata.nasa.gov/?l=MERRA2_2m_Air_Temperature_Monthly,Reference_Labels_15m(hidden),Reference_Features_15m(hidden),Coastlines_15m,VIIRS_SNPP_CorrectedReflectance_TrueColor(hidden),MODIS_Aqua_CorrectedReflectance_TrueColor(hidden),MODIS_Terra_CorrectedReflectance_TrueColor&lg=false&t=2020-03-04-T14%3A08%3A35Z")));},
                        color: Colors.red,
                        textColor: Colors.yellow,
                        padding: EdgeInsets.all(8.0),
                        splashColor: Colors.grey,
                      ),
                    RaisedButton(
                      child: Text("Humidity", style: TextStyle(fontSize: 20),),
                      onPressed: (){Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => YourWebView("https://worldview.earthdata.nasa.gov/?l=AIRS_L3_Surface_Relative_Humidity_Daily_Night(hidden),AIRS_L3_Surface_Relative_Humidity_Daily_Day,Reference_Labels_15m(hidden),Reference_Features_15m(hidden),Coastlines_15m,VIIRS_SNPP_CorrectedReflectance_TrueColor(hidden),MODIS_Aqua_CorrectedReflectance_TrueColor,MODIS_Terra_CorrectedReflectance_TrueColor(hidden)&lg=false&t=2016-09-24-T16%3A13%3A57Z")));},
                      color: Colors.red,
                      textColor: Colors.yellow,
                      padding: EdgeInsets.all(8.0),
                      splashColor: Colors.grey,
                    ),
                    RaisedButton(
                      child: Text("Ultra Violet Radiation", style: TextStyle(fontSize: 20),),
                      onPressed: (){Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => YourWebView("https://worldview.earthdata.nasa.gov/?l=OMI_UV_Erythemal_Daily_Dose,OMI_UV_Index,Reference_Labels_15m(hidden),Reference_Features_15m(hidden),Coastlines_15m,VIIRS_SNPP_CorrectedReflectance_TrueColor(hidden),MODIS_Aqua_CorrectedReflectance_TrueColor(hidden),MODIS_Terra_CorrectedReflectance_TrueColor&lg=false&t=2020-04-30-T13%3A51%3A38Z")));},
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