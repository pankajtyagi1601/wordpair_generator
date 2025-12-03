import "package:flutter/material.dart";
import "./random_words.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: Colors.amber[900]),
      ),
      home: RandomWords(),
    );
  }
}
