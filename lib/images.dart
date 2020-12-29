import 'dart:math';

class Images {
  static List<String> images = [
    "أسد.png",
    "بقره.jpg",
    "تمساح.png",
    "ثياب.png",
    "جمل.png",
    "حمامة.png",
    "خيار.png",
    "دوم.jpg",
    "ذئب.jpg",
    "رف.jpg",
    "زرافه.jpg",
    "سفينه.jpg",
    "شماعه.jpg",
    "صقر.jpg",
    "ضفدع.png",
    "طبله.png",
    "ظرف.jpg",
    "عروسه.png",
    "غزال.png",
    "فراوله.png",
    "قمر.png",
    "كتب.png",
    "لسان.png",
    "مانجو.png",
    "نجم.png",
    "هرم.png",
    "ولد.png",
    "يد.png",
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
