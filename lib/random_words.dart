import "package:flutter/material.dart";
import "package:english_words/english_words.dart";

class RandomWords extends StatefulWidget {
  const RandomWords({super.key});

  @override
  RandomWordsState createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final List<WordPair> randomWordPairs = <WordPair>[];
  final Set<WordPair> savedWordPairs = {};

  Widget _buildRow(WordPair pair) {
    final alreadySaved = savedWordPairs.contains(pair);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 3),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.yellow[200],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.deepOrange),
        ),
        child: ListTile(
          title: Text(
            pair.asPascalCase,
            style: TextStyle(fontSize: 20, color: Colors.amber[900]),
          ),
          trailing: Icon(
            alreadySaved ? Icons.favorite : Icons.favorite_border,
            color: alreadySaved ? Colors.amber[900] : null,
          ),
          onTap: () {
            setState(() {
              if (alreadySaved) {
                savedWordPairs.remove(pair);
              } else {
                savedWordPairs.add(pair);
              }
            });
          },
        ),
      ),
    );
  }

  Widget _buildList() {
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

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return SavedWordPairs(saved: savedWordPairs);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Word Pair Generator",
          style: TextStyle(fontSize: 24, color: Colors.yellow[50]),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: _pushSaved,
            icon: Icon(Icons.list, color: Colors.yellow[50]),
          ),
        ],
      ),
      body: _buildList(),
    );
  }
}

class SavedWordPairs extends StatefulWidget {
  final Set<WordPair> saved;

  const SavedWordPairs({super.key, required this.saved});

  @override
  State<SavedWordPairs> createState() => _SavedWordPairsState();
}

class _SavedWordPairsState extends State<SavedWordPairs> {
  @override
  Widget build(BuildContext context) {
    final tiles = widget.saved.map((pair) => _buildSavedRow(pair));

    final divided = ListTile.divideTiles(
      tiles: tiles,
      context: context,
      color: Colors.grey[350],
    ).toList();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Saved WordPairs",
          style: TextStyle(fontSize: 24, color: Colors.yellow[50]),
        ),
        iconTheme: IconThemeData(color: Colors.amber[50]),
      ),
      body: ListView(children: divided),
    );
  }

  Widget _buildSavedRow(WordPair pair) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.yellow[200],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.deepOrange),
        ),
        child: ListTile(
          title: Text(
            pair.asPascalCase,
            style: TextStyle(color: Colors.amber[900], fontSize: 20),
          ),
          trailing: IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: () {
              setState(() {
                widget.saved.remove(pair);
              });
            },
          ),
        ),
      ),
    );
  }
}
