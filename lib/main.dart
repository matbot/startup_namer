// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MatsApp());

class MatsApp extends StatelessWidget {
  //BUILD
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Welcome to Flutter!",
      home: RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  //PROPERTIES
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18);

  //METHODS
  Widget _buildSuggestions() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, i) {
        if (i.isOdd) return Divider(); //Divider() is a 1px height divider
        final index = i ~/ 2; //~/2 is integer division in Dart
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs()
              .take(10)); //WordPairs are generated 10 at a time.
        }
        return _buildRow(_suggestions[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }

  //BUILD
  @override
  Widget build(BuildContext context) {
    //I like the SafeArea widget because impinging on the system bar bothers me.
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Startup Name Generator"),
        ),
        body: _buildSuggestions(),
      ),
    );
  }
}
