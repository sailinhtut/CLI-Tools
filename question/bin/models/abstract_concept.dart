/// Abstraction and Inheritance
// Abstract Parent Class
abstract class Human {
  String name;
  int age;

  Human(this.name, this.age);

  showInfo() {
    print(
        'The age of ${nameBeautify()} is $age.');
  }

  String nameBeautify() {
    List<String> words = name.split(' ');
    String nameToReturn = '';
    for (String element in words) {
      String firstLetter =
          element.substring(0, 1);
      if (words.last == element) {
        nameToReturn += element.replaceFirst(
            firstLetter,
            firstLetter.toUpperCase());
        continue;
      } else {
        nameToReturn += element.replaceFirst(
                firstLetter,
                firstLetter.toUpperCase()) +
            ' ';
      }
    }
    return nameToReturn;
  }
}

// Child One
class Boy extends Human {
  static final _cache = {};

  Boy._testPurpose(String name, int age)
      : super(name, age);

  Boy._private(String name, int age)
      : super(name, age);

  factory Boy.test(String name, int age) {
    return _cache.putIfAbsent("cacheInstanceBoy",
        () => Boy._testPurpose(name, age));
  }

  factory Boy(String name, int age) {
    return Boy._private(name, age);
  }
}

// Child Two
class Girl extends Human {
  static final _cache = {};

  Girl._testPurpose(String name, int age)
      : super(name, age);

  Girl._private(String name, int age)
      : super(name, age);

  factory Girl.test(String name, int age) {
    return _cache.putIfAbsent("cacheInstanceBoy",
        () => Girl._testPurpose(name, age));
  }

  factory Girl(String name, int age) {
    return Girl._private(name, age);
  }
}
