import 'dart:math';

import './screens/choose_image_screen.dart';

class DummyData {
  static int numberOfPages = 0;
  List<ChooseImageScreen> data = [
    new ChooseImageScreen(
      name: 'زرافه',
      correctImagePath: 'images/زرافه.jpg',
      imagePath1: 'images/ارنب.jpg',
      imagePath2: 'images/فيل.png',
    ),
    new ChooseImageScreen(
      name: 'فيل',
      correctImagePath: 'images/فيل.png',
      imagePath1: 'images/زرافه.jpg',
      imagePath2: 'images/ارنب.jpg',
    ),
  ];

  void _randomData() {
    List<ChooseImageScreen> randomData = [];
    Random r = new Random();
    while (randomData.length != data.length) {
      int num = r.nextInt(data.length);
      if (!randomData.contains(data[num])) {
        randomData.add(data[num]);
      }
    }
    data = randomData;
    numberOfPages++;
  }

  ChooseImageScreen get item {
    _randomData();
    if (numberOfPages >= data.length) {
      return null;
    }
    return data[0];
  }
}
