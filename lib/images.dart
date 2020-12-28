import 'dart:math';

class Images {
  static List<String> images = [
    "assets/images/دوم.jpg",
    "assets/images/ذئب.jpg",
    "assets/images/رف.jpg",
    "assets/images/زرافه.jpg",
    "assets/images/سفينه.jpg",
    "assets/images/شماعه.jpg",
    "assets/images/صقر.jpg",
    "assets/images/ضفدع.jpg",
    "assets/images/طبله.jpg",
    "assets/images/ظرف.jpg",
    "assets/images/عروسه.jpg",
    "assets/images/غزال.jpg",
    "assets/images/فراوله.jpg",
    "assets/images/قمر.jpg",
  ];
  List<String> getRandomImages(String name) {
    List<String> radomImages = [];
    Random r = new Random();
    while (radomImages.length != 2) {
      int num = r.nextInt(images.length);
      if (!images[num].contains(name) && !radomImages.contains(images[num])) {
        radomImages.add(images[num]);
      }
    }
    return radomImages;
  }
}
