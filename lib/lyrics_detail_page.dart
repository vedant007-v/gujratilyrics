import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'lyrics_provider.dart';

class LyricsDetailPage extends StatelessWidget {
  final Lyrics lyrics;

  LyricsDetailPage({required this.lyrics});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(lyrics.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                lyrics.title,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Author: ${lyrics.author}',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
                ),
              ),
              SizedBox(height: 20),
              Text(
                lyrics.content,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
