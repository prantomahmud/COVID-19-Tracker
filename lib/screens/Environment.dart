import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
void main() {
  runApp(MyApp1());
}

class MyApp1 extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp1> {
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
                        onPressed: (){Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => YourWebView("https://worldview.earthdata.nasa.gov/?v=-266.9498957674787,-103.36905852733365,237.6366687400112,106.44438850067094&l=AIRS_L2_Carbon_Monoxide_500hPa_Volume_Mixing_Ratio_Night,AIRS_L2_Carbon_Monoxide_500hPa_Volume_Mixing_Ratio_Day,Reference_Labels_15m(hidden),Reference_Features_15m(hidden),Coastlines_15m,VIIRS_SNPP_CorrectedReflectance_TrueColor(hidden),MODIS_Aqua_CorrectedReflectance_TrueColor,MODIS_Terra_CorrectedReflectance_TrueColor(hidden)&lg=false&t=2021-03-01-T14%3A18%3A06Z")));},
                        color: Colors.red,
                        textColor: Colors.yellow,
                        padding: EdgeInsets.all(8.0),
                        splashColor: Colors.grey,
                      ),
                      RaisedButton(
                        child: Text("Nitrogen Dioxide", style: TextStyle(fontSize: 20),),
                        onPressed:(){Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => YourWebView("https://worldview.earthdata.nasa.gov/?l=OMI_Nitrogen_Dioxide_Tropo_Column,Reference_Labels_15m(hidden),Reference_Features_15m(hidden),Coastlines_15m,VIIRS_SNPP_CorrectedReflectance_TrueColor(hidden),MODIS_Aqua_CorrectedReflectance_TrueColor(hidden),MODIS_Terra_CorrectedReflectance_TrueColor&lg=false&t=2021-10-01-T16%3A44%3A09Z")));},
                        color: Colors.red,
                        textColor: Colors.yellow,
                        padding: EdgeInsets.all(8.0),
                        splashColor: Colors.grey,
                      ),
                      Text('Ozon Layer:', style: TextStyle(fontSize: 15, fontStyle: FontStyle.italic),),
                      RaisedButton(
                        child: Text("1.World View", style: TextStyle(fontSize: 20),),
                        onPressed: (){Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => YourWebView("https://worldview.earthdata.nasa.gov/?l=OMI_Ozone_DOAS_Total_Column,Reference_Labels_15m(hidden),Reference_Features_15m(hidden),Coastlines_15m,VIIRS_SNPP_CorrectedReflectance_TrueColor(hidden),MODIS_Aqua_CorrectedReflectance_TrueColor(hidden),MODIS_Terra_CorrectedReflectance_TrueColor&lg=false&t=2021-10-01-T16%3A44%3A58Z")));},
                        color: Colors.red,
                        textColor: Colors.yellow,
                        padding: EdgeInsets.all(8.0),
                        splashColor: Colors.grey,
                      ),
                      RaisedButton(
                        child: Text("2.Sample Highlight: Video", style: TextStyle(fontSize: 20),),
                        onPressed: (){Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => YourWebView("https://svs.gsfc.nasa.gov/vis/a000000/a004900/a004912/covid_ozone_z9_500hPa.mp4")));},
                        color: Colors.red,
                        textColor: Colors.yellow,
                        padding: EdgeInsets.all(8.0),
                        splashColor: Colors.grey,
                      ),
                      Text('Water Quality:', style: TextStyle(fontSize: 15, fontStyle: FontStyle.italic),),
                      RaisedButton(
                        child: Text("Sea Surface temperature", style: TextStyle(fontSize: 20),),
                        onPressed: (){Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => YourWebView("https://worldview.earthdata.nasa.gov/?l=MODIS_Terra_L3_SST_Thermal_4km_Day_Daily,MODIS_Terra_L3_SST_MidIR_4km_Night_Daily,MODIS_Aqua_L3_SST_Thermal_4km_Day_Daily,MODIS_Aqua_L3_SST_MidIR_4km_Night_Daily,Reference_Labels_15m(hidden),Reference_Features_15m(hidden),Coastlines_15m,VIIRS_SNPP_CorrectedReflectance_TrueColor(hidden),MODIS_Aqua_CorrectedReflectance_TrueColor(hidden),MODIS_Terra_CorrectedReflectance_TrueColor&lg=false&t=2019-08-04-T18%3A35%3A05Z")));},
                        color: Colors.red,
                        textColor: Colors.yellow,
                        padding: EdgeInsets.all(8.0),
                        splashColor: Colors.grey,
                      ),
                      RaisedButton(
                        child: Text("Land Surface temperature", style: TextStyle(fontSize: 20),),
                        onPressed: (){Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => YourWebView("https://worldview.earthdata.nasa.gov/?l=MODIS_Terra_Land_Surface_Temp_Day,MODIS_Aqua_Land_Surface_Temp_Day,Reference_Labels_15m(hidden),Reference_Features_15m(hidden),Coastlines_15m,VIIRS_SNPP_CorrectedReflectance_TrueColor(hidden),MODIS_Aqua_CorrectedReflectance_TrueColor(hidden),MODIS_Terra_CorrectedReflectance_TrueColor&lg=false&t=2021-10-01-T16%3A55%3A51Z")));},
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