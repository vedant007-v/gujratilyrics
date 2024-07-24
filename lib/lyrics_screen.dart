import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LyricsScreen extends StatelessWidget {
  final String songTitle;
  final String artistName;
  final String lyrics;

  LyricsScreen({required this.songTitle, required this.artistName, required this.lyrics});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(songTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              songTitle,
              style: GoogleFonts.notoSansGujarati(
                textStyle: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              'Artist: $artistName',
              style: GoogleFonts.notoSansGujarati(
                textStyle: TextStyle(
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  lyrics,
                  style: GoogleFonts.notoSansGujarati(
                    textStyle: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
