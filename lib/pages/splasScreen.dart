import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movieapp/pages/latest.dart';
import 'package:movieapp/services/httpservice1.dart';
import 'package:http/http.dart' as http;


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
//  List data;
//  @override
//  void initState() {
//    super.initState();
//    getData();
//    getResults();
//
//  }
//
//
//  String url =
//      'https://api.themoviedb.org/3/discover/movie?api_key=53dc675006feb93a71c3678bab563b03&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&year=2020';
//
//
//  void getData() {
//    Future<String> getResults() async {
//      var response = await http.get(url);
//      print(response.statusCode);
//      setState(() {
//        var myResults = jsonDecode(response.body);
//        data = myResults['results'];
//        print(response.body);
//        Navigator.push(context, MaterialPageRoute(
//            builder: (context) => Latest()
//        ));
//      });
//      return 'success';
//    }
//
//  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
