import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Latest extends StatelessWidget {
  final urlss;
  Latest({@required this.urlss});
//  final data;
//  Latest({@required this.data});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureResults(
        urls: urlss,
      ),
    );
  }
}

class FutureResults extends StatefulWidget {
  final String urls;
  FutureResults({@required this.urls});

  @override
  _FutureResultsState createState() => _FutureResultsState();
}

class _FutureResultsState extends State<FutureResults> {
  //String url = 'https://api.themoviedb.org/3/trending/all/week?api_key=53dc675006feb93a71c3678bab563b03';

  List data;

  @override
  void initState() {
    super.initState();
    this.getResults();
  }

  Future<String> getResults() async {
    var response = await http.get(widget.urls);
    print(response.statusCode);
    setState(() {
      var myResults = jsonDecode(response.body);
      data = myResults['results'];
    });
    return 'success';
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getResults(),
      builder: (context, projectSnap) {
        if (projectSnap.connectionState == ConnectionState.none &&
            projectSnap.hasData == null) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              return ShowCard(
                backDropPath: data[index]['backdrop_path'],
                title: data[index]['title'],
                releaseDate: data[index]['release_date'],
                overview: data[index]['overview'],
                mediaType: data[index]['media_type'],
                name: data[index]['name'],
                firstairDate: data[index]['first_air_date'],
              );
            });
      },
    );
  }
}

class ShowCard extends StatelessWidget {
  final String backDropPath;
  final String title;
  final String releaseDate;
  final String overview;
  final String mediaType;
  final String name;
  final String firstairDate;

  ShowCard(
      {this.backDropPath,
      this.title,
      this.releaseDate,
      this.overview,
      this.mediaType,
      this.name,
      this.firstairDate});
  @override
  String getTitleorName() {
    if (title == null) {
      return name;
    }
    return title;
  }

  String getDate() {
    if (releaseDate == null) {
      return firstairDate;
    }
    return releaseDate;
  }

  String getMediaType() {
    if (mediaType == null) {
      return null;
    }
    return mediaType;
  }

  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 4,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage('https://image.tmdb.org/t/p/w92$backDropPath'),
        ),
      ),
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          //filter: ImageFilter.blur(sigmaY: 1, sigmaX: 1),
          child: Container(
            color: Colors.grey.withOpacity(0.1),
            padding: EdgeInsets.all(8),
            child: Row(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height / 4,
                  width: MediaQuery.of(context).size.width / 3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://image.tmdb.org/t/p/w92$backDropPath'),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        getTitleorName(),
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 16),
                      ),
                      Text(getDate()),
                      //Text(mediaType),
                      Flexible(
                        child: Text(
                          overview,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                      //Text(overview),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
