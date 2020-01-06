// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MatsApp());

class MatsApp extends StatelessWidget {
  //PROPERTIES

  //METHODS

  //BUILD
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();

    return MaterialApp(
      title: "Welcome to Flutter",
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Welcome to Flutter!"),
          ),
          body: Center(
            child: Text(wordPair.asPascalCase),
          ),
        ),
      ),
    );
  }
}
