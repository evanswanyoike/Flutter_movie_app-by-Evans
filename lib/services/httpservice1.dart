import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movieapp/discover.dart';

List<Results> list;

String url =
    'https://api.themoviedb.org/3/discover/movie?api_key=53dc675006feb93a71c3678bab563b03&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&year=2020';

Future<String> getResults() async {
  var  response = await http.get(url);
  print(response.body);

  list = (jsonDecode(response.body) as List)
      .map((i) => Results.fromJson(i))
      .toList();
}


