import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:math';

void main() {
  runApp(RandomQuoteApp());
}

class RandomQuoteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: QuotePage(),
    );
  }
}

class QuotePage extends StatefulWidget {
  @override
  _QuotePageState createState() => _QuotePageState();
}

class _QuotePageState extends State<QuotePage> {
  String currentQuote = "Faith is the highest passion in a human being";
  final List<String> quotes = [
    "Hope is like the sun, which, as we journey toward it, casts the shadow of our burden behind us."
    "The best way to predict the future is to create it. - Peter Drucker",
    "Life is what happens when you're busy making other plans. - John Lennon",
    "Success is not the key to happiness. Happiness is the key to success. - Albert Schweitzer",
    "The only limit to our realization of tomorrow is our doubts of today. - Franklin D. Roosevelt",
    "Do what you can, with what you have, where you are. - Theodore Roosevelt",
  ];
  int quoteIndex = 0;

  void generateRandomQuote() {
    final random = Random();
    setState(() {
      quoteIndex = random.nextInt(quotes.length);
      currentQuote = quotes[quoteIndex];
    });
  }

  void shareQuote() {
    Share.share(currentQuote);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Random Quote Generator",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 10,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.teal, Colors.greenAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal.shade100, Colors.teal.shade400],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedSwitcher(
                duration: Duration(milliseconds: 600),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return RotationTransition(
                    turns: Tween(begin: 0.5, end: 1.0).animate(animation),
                    child: child,
                  );
                },
                child: Container(
                  key: ValueKey<int>(quoteIndex), // Unique key for each quote
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Text(
                    currentQuote,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontStyle: FontStyle.italic,
                      color: Colors.black87,
                      shadows: [
                        Shadow(
                          color: Colors.grey.shade300,
                          blurRadius: 2,
                          offset: Offset(1, 1),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40.0),
              ElevatedButton(
                onPressed: generateRandomQuote,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal.shade600,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  elevation: 5,
                ),
                child: Text(
                  "Generate Quote",
                  style: TextStyle(fontSize: 16.0, color: Colors.white),
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: shareQuote,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent.shade400,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  elevation: 5,
                ),
                child: Text(
                  "Share Quote",
                  style: TextStyle(fontSize: 16.0, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
