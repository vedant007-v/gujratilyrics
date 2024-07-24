import 'package:flutter/material.dart';
import 'package:gujratilyrics/lyrics_detail_page.dart';
import 'package:provider/provider.dart';
import 'lyrics_provider.dart';

class LyricsSearch extends SearchDelegate<Lyrics?> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear, color: Colors.red),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back, color: Colors.blue),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = Provider.of<LyricsProvider>(context).searchLyrics(query);

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue.shade100, Colors.blue.shade300],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: ListView.builder(
        itemCount: results.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: index % 2 == 0 ? Colors.blue.shade50 : Colors.white,
            child: ListTile(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              title: Text(
                results[index].title,
                style: TextStyle(
                  color: Colors.blue.shade700,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                results[index].author,
                style: TextStyle(
                  color: Colors.black54,
                ),
              ),
              trailing: Icon(Icons.chevron_right, color: Colors.blue.shade700),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        LyricsDetailPage(lyrics: results[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions =
        Provider.of<LyricsProvider>(context).searchLyrics(query);

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.green.shade100, Colors.green.shade300],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: index % 2 == 0 ? Colors.green.shade50 : Colors.white,
            child: ListTile(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              title: Text(
                suggestions[index].title,
                style: TextStyle(
                  color: Colors.green.shade700,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                suggestions[index].author,
                style: TextStyle(
                  color: Colors.black54,
                ),
              ),
              trailing: Icon(Icons.chevron_right, color: Colors.green.shade700),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        LyricsDetailPage(lyrics: suggestions[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
