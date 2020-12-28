import 'dart:math';

class Images {
  static List<String> images = [
    "assets/images/أسد.png",
    "assets/images/بقره.jpg",
    "assets/images/تمساح.png",
    "assets/images/ثياب.png",
    "assets/images/جمل.png",
    "assets/images/حمامة.png",
    "assets/images/خيار.png",
    "assets/images/دوم.jpg",
    "assets/images/ذئب.jpg",
    "assets/images/رف.jpg",
    "assets/images/زرافه.jpg",
    "assets/images/سفينه.jpg",
    "assets/images/شماعه.jpg",
    "assets/images/صقر.jpg",
    "assets/images/ضفدع.png",
    "assets/images/طبله.png",
    "assets/images/ظرف.jpg",
    "assets/images/عروسه.png",
    "assets/images/غزال.png",
    "assets/images/فراوله.png",
    "assets/images/قمر.png",
    "assets/images/كتب.png",
    "assets/images/لسان.png",
    "assets/images/مانجو.png",
    "assets/images/نجم.png",
    "assets/images/هرم.png",
    "assets/images/ولد.png",
    "assets/images/يد.png",
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
