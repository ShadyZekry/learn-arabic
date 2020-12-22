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
  bool isFirstSelected = false; // is first image selected
  bool isSecondSelected = false; // is second image selected
  bool isThirdSelected = false; // is third image selected

  AudioPlayer wrongAdvancedPlayer;
  AudioPlayer rightAdvancedPlayer;
  AudioCache wrongAudioCache;
  AudioCache rightAudioCache;

  @override
  void initState() {
    super.initState();
    wrongAdvancedPlayer = new AudioPlayer();
    rightAdvancedPlayer = new AudioPlayer();
    wrongAudioCache = new AudioCache(fixedPlayer: wrongAdvancedPlayer);
    rightAudioCache = new AudioCache(fixedPlayer: rightAdvancedPlayer);
  }

  void _playWrongSound() {
    rightAdvancedPlayer.stop();
    wrongAudioCache.play('music/wrong.mp3');
  }

  void _playRightSound() {
    wrongAdvancedPlayer.stop();
    rightAudioCache.play('music/right.mp3');
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
    wrongAdvancedPlayer.dispose();
    rightAdvancedPlayer.dispose();
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 10),
                ImageCard(
                  imagePath: !isFirstSelected
                      ? randomImages[0]
                      : randomImages[0].contains(widget.name)
                          ? playRightSoundAndReturnImagePath(
                              'images/right.jpg',
                            )
                          : playWrongSoundAndReturnImagePath(
                              'images/wrong.jpg',
                            ),
                  onPress: () {
                    setState(() {
                      isFirstSelected = !isFirstSelected;
                    });
                  },
                ),
                SizedBox(width: 10),
                ImageCard(
                  imagePath: !isSecondSelected
                      ? randomImages[1]
                      : randomImages[1].contains(widget.name)
                          ? playRightSoundAndReturnImagePath(
                              'images/right.jpg',
                            )
                          : playWrongSoundAndReturnImagePath(
                              'images/wrong.jpg',
                            ),
                  onPress: () {
                    setState(() {
                      isSecondSelected = !isSecondSelected;
                    });
                  },
                ),
                SizedBox(width: 10),
                ImageCard(
                  imagePath: !isThirdSelected
                      ? randomImages[2]
                      : randomImages[2].contains(widget.name)
                          ? playRightSoundAndReturnImagePath(
                              'images/right.jpg',
                            )
                          : playWrongSoundAndReturnImagePath(
                              'images/wrong.jpg',
                            ),
                  onPress: () {
                    setState(() {
                      isThirdSelected = !isThirdSelected;
                    });
                  },
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
