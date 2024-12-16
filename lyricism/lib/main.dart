import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() {
  runApp(const QuotesGridApp());
}

class QuotesGridApp extends StatelessWidget {
  const QuotesGridApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quotes App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const QuotesGridPage(),
    );
  }
}

class QuotesGridPage extends StatelessWidget {
  const QuotesGridPage({super.key});

  final List<Map<String, String>> quotes = const [
    {
      'tagline': 'To Saminder',
      'lyrics': '',
      'message': 'I\'ve not met many people willing to roast me within the first week of us meeting (an a racially motivated roast no less).\nKinda wild when I think about it, but I knew off-rip that we\'d be cool.'
      'While I\'ll never forgive you for exposing my scamming activities, I very much appreciate home much of a good friend you have been for me. Cheers to many more years!',
      'spotifyUrl': '',
      'from': ''
    },
    {
      'tagline': 'In memory of your black card',
      'lyrics': '',
      'message': 'Your attempts at whining at the Christmas party have been reviewed by the black high council.\n'
      '',
      'spotifyUrl': '',
      'from': ''
    },
    {
      'tagline': 'In appreciation of your committment to the bit',
      'lyrics': 'We gotta go',
      'message': 'It\'s actually impressive how you manage to be the last person ready for the gym every week and yet you\'ll always pretend you\'ve '
      'been waiting. I\'m sharing this song with you as it will be the alarm for you to get ready for the gym. Maybe now you\'ll actually be ready on time.',
      'spotifyUrl': 'https://open.spotify.com/track/65X7IUg2rPy57wK7mnVNqS?si=123154a919c9418d',
      'from': 'Ian'
    },
    {
      'tagline': '',
      'lyrics': '',
      'message': '',
      'spotifyUrl': '',
      'from': ''
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Quotes Grid')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount: quotes.length,
          itemBuilder: (context, index) {
            final quote = quotes[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => QuoteDetailPage(quote: quote),
                  ),
                );
              },
              child: Card(
                color: Colors.lightBlue[50],
                child: Center(
                  child: Text(
                    quote['tagline']!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class QuoteDetailPage extends StatelessWidget {
  final Map<String, String> quote;

  const QuoteDetailPage({super.key, required this.quote});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Quote Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              quote['lyrics']!,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              'Context: ${quote['message']}',
              style: const TextStyle(fontSize: 16),
            ),
            const Spacer(),
            Center(
              child: QrImage(
                data: quote['spotifyUrl']!,
                version: QrVersions.auto,
                size: 200.0,
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Open Spotify link
                },
                child: const Text('Open in Spotify'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
