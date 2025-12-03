import "package:flutter/material.dart";
import "package:english_words/english_words.dart";

class RandomWords extends StatefulWidget {
  const RandomWords({super.key});

  @override
  RandomWordsState createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  Widget _buildList() {
    final List<WordPair> randomWordPairs = <WordPair>[];

    return ListView.builder(
      padding: const EdgeInsets.all(8),

      itemBuilder: (context, item) {
        if (item.isOdd) return Divider();

        final index = item ~/ 2;
        if (index >= randomWordPairs.length) {
          randomWordPairs.addAll(generateWordPairs().take(10));
        }
        return _buildRow(randomWordPairs[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 3),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.yellow[200],
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          // tileColor: index.isEven ? Colors.amber[10] : Colors.amber[100],
          title: Text(
            pair.asPascalCase,
            style: TextStyle(fontSize: 20, color: Colors.amber[900]),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Word Pair Generator")),
      body: _buildList(),
    );
  }
}
