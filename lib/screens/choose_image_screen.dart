import 'package:flutter/material.dart';
import '../widgets/image_card.dart';
import 'dart:math';
import '../dummy_data.dart';
import 'end_of_items_screen.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';

class ChooseImageScreen extends StatefulWidget {
  final String name;
  final String correctImagePath;
  final String imagePath1;
  final String imagePath2;
  ChooseImageScreen({
    @required this.name,
    @required this.correctImagePath,
    @required this.imagePath1,
    @required this.imagePath2,
  });

  @override
  _ChooseImageScreenState createState() => _ChooseImageScreenState();
}

// to random the place of the correct answer
List<int> getRandomNumbers() {
  List<int> numbers = [];
  Random r = new Random();
  while (numbers.length != 3) {
    int num = r.nextInt(3);
    if (!numbers.contains(num)) {
      numbers.add(num);
    }
  }
  return numbers;
}

class _ChooseImageScreenState extends State<ChooseImageScreen> {
  final item = new DummyData().item;
  final numbers = getRandomNumbers();

  final String rightImage = 'assets/images/right.jpg';
  final String wrongImage = 'assets/images/wrong.jpg';

  AudioCache _audioPlayer =
      AudioCache(prefix: 'assets/music/', fixedPlayer: AudioPlayer());

  void _playWrongSound() async {
    await _audioPlayer.play('wrong.mp3');
  }

  void _playRightSound() async {
    await _audioPlayer.play('right.mp3');
  }

  String playWrongSoundAndReturnImagePath(imagePath) {
    _playWrongSound();
    return imagePath;
  }

  String playRightSoundAndReturnImagePath(imagePath) {
    _playRightSound();
    return imagePath;
  }

  @override
  void dispose() {
    _audioPlayer.clearCache();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> images = [
      widget.correctImagePath,
      widget.imagePath1,
      widget.imagePath2
    ];
    List<String> randomImages = [
      images[numbers[0]],
      images[numbers[1]],
      images[numbers[2]]
    ];
    return Scaffold(
      backgroundColor: Color(0xff5566bf4),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(' اختار الصوره الصحيحه '),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                widget.name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ...randomImages.map(
                  (String imagePath) => ImageCard(
                    imagePath: imagePath,
                    isRightAnswer: imagePath.contains(widget.name),
                    audioPlayer: _audioPlayer,
                  ),
                ),
                SizedBox(width: 10),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: RaisedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => item != null
                  ? ChooseImageScreen(
                      name: item.name,
                      correctImagePath: item.correctImagePath,
                      imagePath1: item.imagePath1,
                      imagePath2: item.imagePath2,
                    )
                  : EndOfItemsScreen(),
            ),
          );
        },
        color: Colors.green,
        child: Text(
          'التالي',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
