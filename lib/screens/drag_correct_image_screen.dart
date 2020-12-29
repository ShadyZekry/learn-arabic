import 'package:flutter/material.dart';
import 'package:learn_arabic/helpers/database_manager.dart';
import '../dummy_data.dart';
import '../images.dart';
import 'choose_image_screen.dart' as c;
import '../widgets/draggable_image.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';
import 'end_of_items_screen.dart';

class DragCorrectImageScreen extends StatefulWidget {
  final String name;
  final String correctImagePath;
  DragCorrectImageScreen({
    @required this.name,
    @required this.correctImagePath,
  });
  @override
  _DragCorrectImageScreenState createState() => _DragCorrectImageScreenState();
}

class _DragCorrectImageScreenState extends State<DragCorrectImageScreen> {
  bool isProgressUpdated = false;
  final item = new DummyData().item;
  AudioCache _audioPlayer =
      AudioCache(prefix: 'assets/music/', fixedPlayer: AudioPlayer());

  void _playWrongSound() async {
    await _audioPlayer.play('wrong.mp3');
  }

  void _playRightSound() async {
    await _audioPlayer.play('right.mp3');

    if (!isProgressUpdated) {
      DatabaseManager.passChooseLevel(widget.name.substring(0, 1));
      isProgressUpdated = true;
    }
  }

  @override
  void dispose() {
    _audioPlayer.clearCache();
    super.dispose();
  }

  final numbers = c.getRandomNumbers();
  bool accepted = false;
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
      backgroundColor: Colors.pink,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Drag The Right Image'),
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
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              alignment: Alignment.center,
              color: Colors.white,
              width: ((MediaQuery.of(context).size.width) / 3),
              height: ((MediaQuery.of(context).size.width) / 3) - 20,
              child: DragTarget(
                builder: (context, List<String> candidateData, rejectedData) {
                  return accepted
                      ? DraggableImage(
                          image: widget.correctImagePath,
                        )
                      : Container();
                },
                onWillAccept: (data) {
                  if (data.contains(widget.name)) {
                    print('accepted');
                    _playRightSound();
                    accepted = true;
                    return true;
                  } else {
                    print('rejected');
                    _playWrongSound();
                    accepted = false;
                    return false;
                  }
                },
              ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ...randomImages.map(
                (String imagePath) => Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Draggable(
                      child: DraggableImage(
                        image: imagePath,
                      ),
                      feedback: DraggableImage(
                        image: imagePath,
                      ),
                      childWhenDragging: Container(),
                      data: imagePath,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
            ],
          )
        ],
      ),
      floatingActionButton: RaisedButton(
        onPressed: () => Navigator.pop(context, true),
        color: Colors.teal,
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
