import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:learn_arabic/helpers/database_manager.dart';

class ImageCard extends StatefulWidget {
  final String imagePath;
  final bool isRightAnswer;
  final AudioCache audioPlayer;

  ImageCard({
    @required this.imagePath,
    @required this.isRightAnswer,
    @required this.audioPlayer,
  });

  @override
  _ImageCardState createState() => _ImageCardState();
}

class _ImageCardState extends State<ImageCard> {
  bool isProgressUpdated = false;
  String answerImage;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: GestureDetector(
          onTap: widget.isRightAnswer ? _playRightAnswer : _playWrongAnswer,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              color: Colors.white,
              height: ((MediaQuery.of(context).size.width) / 3) - 20,
              child: Image.asset(
                answerImage ?? 'assets/images/' + widget.imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _playRightAnswer() {
    if (answerImage != null) {
      setState(() => answerImage = null);
      return;
    }

    if (!isProgressUpdated) {
      DatabaseManager.passChooseLevel(widget.imagePath.substring(0, 1));
      isProgressUpdated = true;
    }

    setState(() => answerImage = 'assets/images/right.jpg');

    widget.audioPlayer.play('right.mp3');
  }

  void _playWrongAnswer() {
    if (answerImage != null) {
      setState(() => answerImage = null);
      return;
    }

    setState(() => answerImage = 'assets/images/wrong.jpg');

    widget.audioPlayer.play('wrong.mp3');
  }
}
