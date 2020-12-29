import 'package:flutter/material.dart';
import '../widgets/image_card.dart';
import 'dart:math';
import '../dummy_data.dart';
import 'end_of_items_screen.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';
import '../images.dart';

class ChooseImageScreen extends StatefulWidget {
  final String name;
  final String correctImagePath;
  ChooseImageScreen({
    @required this.name,
    @required this.correctImagePath,
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

  @override
  void dispose() {
    _audioPlayer.clearCache();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final randomTwoImages = Images().getRandomImages(widget.name);
    List<String> images = [
      widget.correctImagePath,
      randomTwoImages[0],
      randomTwoImages[1]
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
        title: Text('Choose The Right Image '),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            alignment: Alignment.center,
            child: Text(
              widget.name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
              ),
            ),
          ),
          Row(
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
          )
        ],
      ),
      floatingActionButton: RaisedButton(
        onPressed: () => Navigator.pop(context, true),
        color: Colors.green,
        child: Text(
          'Next',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
