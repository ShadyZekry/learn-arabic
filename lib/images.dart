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
    "assets/images/كتب.jpg",
    "assets/images/لسان.jpg",
    "assets/images/مانجو.jpg",
    "assets/images/نجمه.jpg",
    "assets/images/هرم.jpg",
    "assets/images/ولد.jpg",
    "assets/images/يد.jpg",
    "assets/images/أسد.png",
    "assets/images/بقره.jpg",
    "assets/images/تمساح.png",
    "assets/images/ثياب.png",
    "assets/images/جمل.png",
    "assets/images/حمامة.png",
    "assets/images/خيار.png",
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
