import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/pages/latest.dart';
import 'package:movieapp/pages/movies.dart';
import 'package:movieapp/pages/search.dart';
import 'package:movieapp/pages/settings.dart';
import 'package:movieapp/pages/tvSeries.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: MyHomePage(),
    );
  }
}

int _index = 0;

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Widget> pages = [
    Latest(
      urlss:
          'https://api.themoviedb.org/3/trending/all/week?api_key=53dc675006feb93a71c3678bab563b03',
    ),
    Latest(
      urlss:
          'https://api.themoviedb.org/3/movie/popular?api_key=53dc675006feb93a71c3678bab563b03&language=en-US&page=1',
    ),
    Latest(
      urlss:
          'https://api.themoviedb.org/3/tv/on_the_air?api_key=53dc675006feb93a71c3678bab563b03&language=en-US&page=1',
    ),
    Search(),
    Settings()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: FloatingNavbar(
        onTap: (int val) => setState(() => _index = val),
        currentIndex: _index,
        backgroundColor: Colors.grey,
        selectedItemColor: CupertinoColors.destructiveRed,
        unselectedItemColor: CupertinoColors.activeBlue,
        items: [
          FloatingNavbarItem(icon: Icons.tv, title: 'Hotest'),
          FloatingNavbarItem(icon: Icons.tv, title: 'Movies'),
          FloatingNavbarItem(icon: Icons.tv, title: 'Tv Series'),
          FloatingNavbarItem(icon: Icons.search, title: 'Search'),
          FloatingNavbarItem(icon: Icons.settings, title: 'settings'),
        ],
      ),
      body: pages[_index],
    );
  }
}
