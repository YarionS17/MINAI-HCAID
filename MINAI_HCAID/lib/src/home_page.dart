import 'dart:async';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // List of movie poster URLs (Replace these URLs with your movie poster URLs)
  final List<String> _moviePosters = [
    'https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg',
    // Sample poster URLs
    'https://image.tmdb.org/t/p/original/q719jXXEzOoYaps6babgKnONONX.jpg',
    //'https://image.tmdb.org/t/p/original/9O7gLzmreU0nGkIB6K3BsJbzvNv.jpg',
    'https://image.tmdb.org/t/p/original/xBHvZcjRiWyobQ9kxBhO6B2dtRI.jpg',
  ];

  // Timer for auto-scrolling
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    // Start timer to auto-scroll the page view every 3 seconds
    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentPage < _moviePosters.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background slideshow
        PageView.builder(
          controller: _pageController,
          itemCount: _moviePosters.length,
          itemBuilder: (context, index) {
            return Image.network(
              _moviePosters[index],
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            );
          },
        ),
        // Dark overlay with opacity for readability
        Container(
          color: Colors.black.withOpacity(0.5),
        ),
        // Content on top of the background
        Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Welcome to Movie Recommendation App",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Text(
                  "Discover movies tailored to your taste. Simply provide your age, gender, and occupation, "
                  "and we'll recommend movie genres you'll likely enjoy!",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
