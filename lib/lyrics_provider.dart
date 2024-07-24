import 'package:flutter/material.dart';

class Lyrics {
  final String title;
  final String author;
  final String content;

  Lyrics({required this.title, required this.author, required this.content});
}

class LyricsProvider with ChangeNotifier {
  List<Lyrics> _lyrics = [
    Lyrics(
      title: 'પ્રેમ એટલે',
      author: 'Traditional',
      content: 'પ્રેમ એટલે ભગવાનનું નરમ હ્રદય...',
    ),
    // Add more lyrics here
  ];

  List<Lyrics> get lyrics => _lyrics;

  void addLyrics(Lyrics lyrics) {
    _lyrics.add(lyrics);
    notifyListeners();
  }

  List<Lyrics> searchLyrics(String query) {
    return _lyrics.where((lyrics) {
      return lyrics.title.toLowerCase().contains(query.toLowerCase()) ||
          lyrics.author.toLowerCase().contains(query.toLowerCase());
    }).toList();
  }
}
