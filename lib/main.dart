import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var cuvRomana=<String>{'salut','ma numesc','cum esti?','sunt bine'};
  var cuvGermana=<String>{'salut(Germana)','ma numesc(Germana)','cum esti?(Germana)','sunt bine(Germana)'};

  Future<void> playAudio(String audioPath) async {
    var player = AudioPlayer();
    await player.play(AssetSource(audioPath));
  }

  Widget buildPhraseBox(String text, String audioPath) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          playAudio(audioPath);
        },
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              end: Alignment.centerRight,
              begin: Alignment.centerLeft,
              colors: [
                Colors.blueAccent,
                Colors.lightBlueAccent,
              ],
            ),
          ),
          alignment: Alignment.center,
          height: 100, // Adjust the height as needed
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Basic Phrases",
            style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: cuvRomana.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildPhraseBox(
                  cuvRomana.elementAt(index),
                    // 'assets/audio/basic_phrases/0${2*index+1}.mp3'
                    'audio/basic_phrases/01.mp3/'
                ),
                SizedBox(width: 20,),
                buildPhraseBox(
                  cuvGermana.elementAt(index),
                    // 'assets/audio/basic_phrases/0${2*index+2}.mp3'
                  'audio/basic_phrases/01.mp3'
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
