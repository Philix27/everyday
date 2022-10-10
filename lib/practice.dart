class Practice {
  // int get h () => // TODO();
  var lili = <String>[];
  // lili.any();

  Iterable<int> _iterable = [1, 2, 3];

  Iterable<int> get iterable => _iterable;

  set iterable(Iterable<int> iterable) {
    _iterable = iterable;
  }

  gu() {
    int value = iterable.elementAt(1);
    // iterable
    // op-op
    // vbop
  }
}

typedef VoidFunction = void Function();

class ExceptionWithMessage {
  final String message;
  const ExceptionWithMessage(this.message);
}

// Call logException to log an exception,
// and doneLogging when finished

abstract class Logger {
  void logException(Type t, [String? msg]);
  void doneLogging();
}

abstract class abc extends Logger {
  void rio();
  void wiliwili();
}

class CPR extends abc {
  double x;
  double y;

  @override
  void doneLogging() {
    // ignore: todo
    // TODO: implement doneLogging
  }

  @override
  void logException(Type t, [String? msg]) {
    // ignore: todo
    // TODO: implement logException
  }

  @override
  void rio() {
    // ignore: todo
    // TODO: implement rio
  }

  @override
  void wiliwili() {
    // ignore: todo
    // TODO: implement wiliwili
  }

  CPR.fromJson(Map<String, double> json)
      : x = json['x']!,
        y = json['y']! {
    print('In Point.fromJson(): ($x, $y)');
  }
}

void tryFunction(VoidFunction untrustworthy, Logger logger) {
  // Invoking this method might cause an exception. Catch and handle
  // them using try-on-catch-finally.
  logger.doneLogging();
  logger.logException(Practice);
  untrustworthy();
}
