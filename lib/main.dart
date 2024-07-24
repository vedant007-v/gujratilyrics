import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gujratilyrics/add_lyrics_page.dart';
import 'package:gujratilyrics/lyrics_detail_page.dart';
import 'package:gujratilyrics/lyrics_provider.dart';
import 'package:gujratilyrics/lyrics_searc.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LyricsProvider(),
      child: MaterialApp(
        title: 'Gujarati Lyrics App',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: LyricsHomePage(),
      ),
    );
  }
}

class LyricsHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gujarati Lyrics', style: GoogleFonts.poppins()),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: LyricsSearch());
            },
          ),
        ],
      ),
      body: Consumer<LyricsProvider>(
        builder: (context, lyricsProvider, child) {
          return ListView.builder(
            itemCount: lyricsProvider.lyrics.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(lyricsProvider.lyrics[index].title, style: GoogleFonts.poppins()),
                subtitle: Text(lyricsProvider.lyrics[index].author, style: GoogleFonts.poppins()),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LyricsDetailPage(lyrics: lyricsProvider.lyrics[index]),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddLyricsPage()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
