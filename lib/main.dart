import "package:flutter/material.dart";
import "package:english_words/english_words.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final String wordPair = WordPair.random().asPascalCase;
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: Colors.amber[900]),
      ),
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          centerTitle: true,
          title: Text("Word Pair Generator", style: TextStyle(fontSize: 25)),
        ),
        body: Center(
          child: Text(
            wordPair,
            style: TextStyle(fontSize: 32, color: Colors.amber[900]),
          ),
        ),
      ),
      //   body: Container(
      //     color: Colors.black,
      //     child: Center(
      //       child: Text(
      //         wordPair,
      //         style: TextStyle(fontSize: 32, color: Colors.amber[900]),
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
