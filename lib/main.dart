import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  final player = AudioCache();
  final notes = [
    'note1.wav',
    'note2.wav',
    'note3.wav',
    'note4.wav',
    'note5.wav',
    'note6.wav',
    'note7.wav'
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Xylophone App'),
        ),
        body: SafeArea(
          child: Center(
            child: getColumn(),
          ),
        ),
      ),
    );
  }

  Column getColumn() {
    final rij = List<Widget>();
    for (var i = 0; i < notes.length; i++) {
      var button = Expanded(
        child: FlatButton(
          onPressed: () {
            playSound(notes[i]);
          },
          color: Colors.accents[2 * i],
          splashColor: Colors.accents[notes.length - i],
        ),
      );
      rij.add(button);
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: rij,
    );
  }

  void playSound(String filename) {
    player.play(filename);
  }
}
