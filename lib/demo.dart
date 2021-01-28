/// Classes and constructors
class Spacecraft {
  String name;
  DateTime launchDate;

  // Constructor, with syntactic sugar for assignment to members.
  Spacecraft(this.name, this.launchDate) {
    // Initialization code goes here.
  }

  // Named constructor that forwards to the default one.
  Spacecraft.unlaunched(String name) : this(name, null);

  int get launchYear => launchDate?.year; // read-only non-final property

  // Method.
  void describe() {
    print('Spacecraft: $name');
    if (launchDate != null) {
      int years = DateTime.now().difference(launchDate).inDays ~/ 365;
      print('Launched: $launchYear ($years years ago)');
    } else {
      print('Unlaunched');
    }
  }
}

/// Inheritance
class Orbiter extends Spacecraft {
  double altitude;
  Orbiter(String name, DateTime launchDate, this.altitude)
      : super(name, launchDate) {
    // Initialization code goes here.
  }
}

/// Abstract class (protocols) + Mixins (Mixins are a way of reusing code in multiple class hierarchies)
class NormalStuff {
  void dontBeRude() {}
}

abstract class Human {
  int age;
  void wearMask();
}

class Saim with NormalStuff implements Human {
  int age = 26;
  void wearMask() {
    print("Put on a mask before leaving");
    dontBeRude();
  }
}

class Variables {
  /// Inferred, vars cannot be given a type according to dart guildelines
  var name = "Saim";
  final name2 = "I cant be changed";

  /// Same as Any, use when type is unknown
  dynamic nameORInt = 'Bob';

  /// Explicit
  final String explicitType = "Bob";
  final int explicitType2 = 1;

  ///A final variable can be set only once; a const variable is a compile-time constant.
  static const bar = 1000000;

  changeItUp() {
    const bar = 1000000;
    final bar2 = 100000;

    name = "Saim 2";
    nameORInt = 1;
  }
}

class Functions {
  // Void methods
  void noReturn() {
    print("NO return");
  }

  noReturnWithNoType() {
    print("NO return");
  }

  int multiply() {
    return 2 * 2;
  }

  int multiplyWithParams(int first, int second) {
    return first * second;
  }

  int multiplyWithNamedParams({int first, int second}) {
    return first * second;
  }

  demo() {
    print(multiplyWithParams(1, 2));

    print(multiplyWithNamedParams(first: 10, second: 30));
  }
}
