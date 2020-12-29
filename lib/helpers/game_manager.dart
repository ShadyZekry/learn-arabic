import 'package:flutter/material.dart';
import 'package:learn_arabic/helpers/database_manager.dart';
import 'package:learn_arabic/images.dart';
import 'package:learn_arabic/screens/choose_image_screen.dart';
import 'package:learn_arabic/screens/drag_correct_image_screen.dart';

class GameManager {
  static List<Map<String, dynamic>> _chooseAvailableLetters;
  static List<Map<String, dynamic>> _dragAvailableLetters;
  static List<dynamic> availableGames;
  static Function _callback;

  GameManager(BuildContext context, Function callback) {
    _proceed(context);
    _callback = callback;
  }

  static void _proceed(BuildContext context) async {
    _chooseAvailableLetters = await DatabaseManager.getIncompleteChooseLevels();
    _dragAvailableLetters = await DatabaseManager.getIncompleteDragLevels();

    List<ChooseImageScreen> chooseAvailableLevels = _createChooseScreens();
    List<DragCorrectImageScreen> dragAvailableLevels = _createDragScreens();

    availableGames = []
      ..addAll(chooseAvailableLevels) //Append all of this list
      ..addAll(dragAvailableLevels) //Append all of this list
      ..shuffle() //shuffle the full list
      // ..add(EndOfItemsScreen()) //Append end screen last one (first one to show)
      ..reversed; // reverse the list to make the end screen last one to show

    bool wanatMoreGames;
    do {
      // pops the last screen from the list and push it to the UI
      dynamic nextGame = availableGames.removeLast();

      wanatMoreGames = await Navigator.push<bool>(
          context, MaterialPageRoute(builder: (context) => nextGame));

      _callback();
      //While we still have games and the user keeps playing
    } while ((wanatMoreGames ?? false) == true &&
        availableGames != null &&
        availableGames.isNotEmpty);
  }

  static List<ChooseImageScreen> _createChooseScreens() {
    return _chooseAvailableLetters.map(
      (Map<String, dynamic> letterMap) {
        //Gets the image name that starts with the letter
        String imagePath = Images.images
            .where((element) => element.startsWith(letterMap["letter"]))
            .toList()[0];

        return ChooseImageScreen(
            name: imagePath.substring(0, imagePath.length - 4),
            correctImagePath: imagePath);
      },
    ).toList();
  }

  static List<DragCorrectImageScreen> _createDragScreens() {
    return _dragAvailableLetters.map(
      (Map<String, dynamic> letterMap) {
        //Gets the image name that starts with the letter
        String imagePath = Images.images
            .where((element) => element.startsWith(letterMap["letter"]))
            .toList()[0];

        return DragCorrectImageScreen(
            name: imagePath.substring(0, imagePath.length - 4),
            correctImagePath: imagePath);
      },
    ).toList();
  }
}
