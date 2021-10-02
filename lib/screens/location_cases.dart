import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<Post> post;
  @override
  void initState() {
    super.initState();
    post = fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Localized Data'),
        ),
        body: Center(
          child: FutureBuilder<Post>(
            future: post,
            builder: (context, AsyncSnapshot<Post> abc) {
              double proba= (abc.data.recovered/abc.data.cases);
              proba=(1-proba)*100;
              proba=proba.roundToDouble();
              switch (abc.connectionState) {
                case ConnectionState.none:
                  return Text('Press button to start.');
                case ConnectionState.active:
                case ConnectionState.waiting:
                  return Text('Awaiting result...');
                case ConnectionState.done:
                  if (abc.hasError)
                    return Text('Error: ${abc.error}');
                  if(proba<=20)
                    return Text('Country: ${abc.data.country}\n'
                      'Deaths: ${abc.data.deaths}\n'
                      'Cases: ${abc.data.cases}\n'
                      'Active: ${abc.data.active}\n'
                      'Infection Probability: $proba%\n'
                        "Risk Level:Normal\nRecommendations : Use One Layered Mask.\nYou Can Travel Freely.Just try to avoid crowdy places if possible.\nDon't forget to sanitize yourself");
                  if(proba<=40)
                    return Text('Country: ${abc.data.country}\n'
                        'Deaths: ${abc.data.deaths}\n'
                        'Cases: ${abc.data.cases}\n'
                        'Active: ${abc.data.active}\n'
                        'Infection Probability: $proba%\n'
                        "Risk Level:Border Line Risk\nRecommendations : Use One Layered Mask.\n You Can Travel Maintaining Precautions.\nYou must avoid crowdy places.\nAnd Must sanitize yourself regularly");
                  if(proba<=60)
                    return Text('Country: ${abc.data.country}\n'
                        'Deaths: ${abc.data.deaths}\n'
                        'Cases: ${abc.data.cases}\n'
                        'Active: ${abc.data.active}\n'
                        'Infection Probability: $proba%\n'
                        "Risk Level:Severe Risk\n Recommendations: Use Two Layered Mask.\n Try to avoid traveling.\nYou must avoid crowdy places.\n And Must sanitize yourself regularly");
                  if(proba<=80)
                    return Text('Country: ${abc.data.country}\n'
                        'Deaths: ${abc.data.deaths}\n'
                        'Cases: ${abc.data.cases}\n'
                        'Active: ${abc.data.active}\n'
                        'Infection Probability: $proba%\n'
                        "Risk Level:\nRecommendations: Use Two Layered Mask.\n Only travel in case of emergency.\nAnd Even if you do wear protective gears.\n You must avoid crowdy places.\n And Must sanitize yourself frequently");
                  if(proba<=100)
                    return Text('Country: ${abc.data.country}\n'
                        'Deaths: ${abc.data.deaths}\n'
                        'Cases: ${abc.data.cases}\n'
                        'Active: ${abc.data.active}\n'
                        'Infection Probability: $proba%\n'
                        "Risk Level:\n Recommendations: Use Three Layered Mask.\n Stay Home All time.\n And maintain social distance.\n Must sanitize yourself frequently");
              // You can reach your snapshot.data['url'] in here
              }
              if(proba<=20)
                return Text("Risk Level:\n Recommendations : Use One Layered Mask.You Can Travel Freely.Just try to avoid crowdy places if possible.Don't forget to sanitize yourself");
              else if(proba<=40)
                return Text("Risk Level:\n Recommendations : Use One Layered Mask. You Can Travel Maintaining Precautions.You must avoid crowdy places.And Must sanitize yourself regularly");
              else if(proba<=60)
                return Text("Risk Level:\n Recommendations: Use Two Layered Mask. Try to avoid traveling.You must avoid crowdy places.And Must sanitize yourself regularly");
              else if(proba<=80)
                return Text("Risk Level:\n Recommendations: Use Two Layered Mask. Only travel in case of emergency.You must avoid crowdy places.And Must sanitize yourself frequently");
              else if(proba<=100)
                return Text("Risk Level:\n Recommendations: Use Three Layered Mask.Stay Home All time.And maintain social distance. Must sanitize yourself frequently");
              return null;
            },
          ),
        ),
      ),
    );
  }
}

Future<Post> fetchPost() async {
  final response = await http.get('https://corona.lmao.ninja/v3/covid-19/countries/bangladesh');

  if (response.statusCode == 200) {
    // If the call to the server was successful (returns OK), parse the JSON.
    return Post.fromJson(json.decode(response.body));
  } else {
    // If that call was not successful (response was unexpected), it throw an error.
    throw Exception('Failed to load post');
  }
}

class Post {
  int cases;
  String country;
  int deaths;
  int active;
  int recovered;

  Post({this.country, this.cases, this.deaths, this. active,this.recovered});

  factory Post.fromJson(Map<String, dynamic> json) {

    return Post(
      country: json['country'],
      cases: json['cases'],
      deaths: json['deaths'],
      recovered: json['recovered'],
        active: json['active']
    );

  }
}