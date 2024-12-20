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
      title: 'Happy bday',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const QuotesGridPage(),
    );
  }
}

class QuotesGridPage extends StatelessWidget {
  const QuotesGridPage({super.key});

  final List<Map<String, String>> quotes = const [
    {
        'tagline': 'A message to Saminder',
        'lyrics': 'Ain\'t nobody like you in this bitch',
        'message': 'I\'ve not met many people willing to roast me within the first week of us meeting (an a racially motivated roast no less).\nKinda wild when I think about it, but I knew off-rip that we\'d be cool.\n'
        'While I\'ll never forgive you for exposing my scamming activities, I do appreciate how much of a good friend you\'ve been to me.',
        'spotifyUrl': 'https://open.spotify.com/track/3BUWNzPWz2mDbptZmGEXpB?si=e8631b3ec3784188',
        'from': ''
      },
      {
        'tagline': 'In appreciation of your one of your greatest assets',
        'lyrics': 'How you feeling, everybody? Hope you had a nice day.',
        'message': 'Never thought I would hear someone be offered a job because of their smile. No matter how tough life gets, keep smiling - it\'ll get you far.',
        'spotifyUrl': 'https://open.spotify.com/track/5SNPmbE3OcIVUlzQj9M32N?si=60c9b8fd2adb40e4',
        'from': ''      
      },
      {
        'tagline': 'In regard for your committment to being on time',
        'lyrics': 'We gotta go',
        'message': 'It\'s actually impressive how you manage to be the last person ready for the gym every week and yet you\'ll always pretend you\'ve '
        'been waiting. This song will be your alarm to pack up so we can go gym. Hopefully you\'ll actually be ready on time.',
        'spotifyUrl': 'https://open.spotify.com/track/65X7IUg2rPy57wK7mnVNqS?si=123154a919c9418d',
        'from': ''
      },
      {
        'tagline': 'In acknowledgement of your loyalty',
        'lyrics': 'Damn I miss my 🥷🏿, pour out a little liquor.',
        'message': 'I remember you saying that you\'d help me hide a body if I asked.\n'
        'Just know that I\'d also expect you to take the fall for it if we got caught.',
        'spotifyUrl': 'https://open.spotify.com/track/63gHnuI9MzZA4lLob8t9IY?si=4382c3ad5f0249a1',
        'from': ''
      },
      {
        'tagline': 'In admiration of your ability to take a joke',
        'lyrics': 'Sometimes we laugh and sometimes we cry',
        'message': 'Thanks for letting us roast you every time you pull one of your 4 faces 😬😁😲😐, or come to work looking like Trossard, or catch you with an umbrella.\nIt won\'t stop but we know you can handle it.',
        'spotifyUrl': 'https://open.spotify.com/track/2SAqBLGA283SUiwJ3xOUVI?si=3eccbd790eb34373',
        'from': ''      
      },
      {
        'tagline': 'In respect of your trustworthy-ness',
        'lyrics': 'I got a million friends, I only trust \'bout four or five of \'em',
        'message': 'It speaks to your character that many of us tell you our secrets and they never get around.\nThanks for being so trustworthy.',
        'spotifyUrl': 'https://open.spotify.com/track/4rkChovyQKSVPBv87qQnIZ?si=8928ade5d1ec4cf9',
        'from': ''      
      },
      {
        'tagline': 'In recognition of your tenacity',
        'lyrics': 'Life hard but I go harder.',
        'message': 'We see how hard you\'ve grinding. Recognise much you\'ve grown this year while you listen to this one.',
        'spotifyUrl': 'https://open.spotify.com/track/7B09ZewAliWo7Y3TdIA7g1?si=461f0199ce5d40e5',
        'from': ''      
      },
      {
        'tagline': 'In tribute to your promo',
        'lyrics': 'Every day I kill it like it try to beat my mother.',
        'message': 'Congrats on winning the hunger games. It was about time your hard work was recognised with a promotion.',
        'spotifyUrl': 'https://open.spotify.com/track/6f0WsFJtn4Ptcil4koEfQP?si=65f3af3405c24111',
        'from': ''      
      },
      {
        'tagline': 'In validation of your sorrows',
        'lyrics': 'How do you fight the feelin\'',
        'message': 'A great thing about this year being over is that you won\'t have to relive any of the bad days again.\nJust keep looking forward, put on your favourite artist and vibe.',
        'spotifyUrl': 'https://open.spotify.com/track/3YchUDysu9jfzeSRG8st77?si=40b7348682a0418a',
        'from': ''      
      },
      {
        'tagline': 'In celebration of your birthday',
        'lyrics': 'Pree more life',
        'message': 'I hope you enjoyed the songs, new and old. Cheers to many more years of friendship!',
        'spotifyUrl': 'https://open.spotify.com/track/73e0LixjWj3e8prfptVeGD?si=9fc96a966d6e4850',
        'from': ''      
      }
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
                color: Colors.purple[50],
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
              '"${quote['lyrics']}"',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 16),
            Text(
              '${quote['message']}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const Spacer(),
            Center(
              child: QrImageView(
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
