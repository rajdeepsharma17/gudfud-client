import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.white);

    return MaterialApp(
      title: 'Startup',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(          // Add the 3 lines from here...
        primaryColor: Colors.white,
      ),
      home: RandomWords(),
    );
  }
}

class RandomWordsState extends State<RandomWords> {

  final List<WordPair> _suggestions = <WordPair>[];
  final Set<WordPair> _saved = new Set<WordPair>();
  final TextStyle _biggerFont = const TextStyle(fontSize: 18.0);

  void _pushSaved() {
    Navigator.of(context).push(
      new MaterialPageRoute<void>(
        builder: (BuildContext context) {
          final Iterable<ListTile> tiles = _saved.map(
                (WordPair pair) {
              return new ListTile(
                title: new Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            },
          );
          final List<Widget> divided = ListTile
              .divideTiles(
            context: context,
            tiles: tiles,
          )
              .toList();

          return new Scaffold(         // Add 6 lines from here...
            appBar: new AppBar(
              title: const Text('Checkout'),
            ),
            body: new ListView(children: divided),
          );                           // ... to here.
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title: Text('GUDFUD', style: TextStyle(
          fontWeight: FontWeight.w600,
          fontFamily: 'ProductSans',
        ),),
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {

  return Column(
    children: <Widget>[
      Expanded(
        child: ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemBuilder: (context, i) {
              if (i.isOdd) return Divider();

              final index = i ~/ 2;
              if (index >= _suggestions.length) {
                _suggestions.addAll(generateWordPairs().take(10));
              }
              return _buildRow(_suggestions[index]);
            }),
      ),
      Row(
        children: <Widget>[
          Expanded(
            child: Container(
              height: 48.0,
              child: Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text('CHECKOUT', style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),),
                    ),
                    Expanded(
                      child: Text('₹ 225', textAlign: TextAlign.end, style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),),
                    )
                  ],
                ),
                padding: EdgeInsets.symmetric(horizontal: 12.0),              ),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0.0, -1.0),
                    blurRadius: 0.5,
                    color: Colors.black12
                  )
                ]
              ),
            ),
          )
        ],
      )
    ],
  );
  }

  Widget _buildRow(WordPair pair) {
    final bool alreadySaved = _saved.contains(pair);
    return ListTile(
      leading: Container(
        width: 40.0,
        height: 40.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(image: NetworkImage('https://seeklogo.com/images/T/twitter-2012-negative-logo-5C6C1F1521-seeklogo.com.png'))
        ),
      ),
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      subtitle: Text('₹ 112'),
      trailing: new Icon(   // Add the lines from here...
        alreadySaved ? Icons.plus_one : Icons.add,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {      // Add 9 lines from here...
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => new RandomWordsState();
}
