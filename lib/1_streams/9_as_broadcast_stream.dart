void main() async {
  print('init');
  final interval = Duration(seconds: 2);
  var stream = Stream<int>.periodic(interval, callback);
  stream = stream.asBroadcastStream();

  stream = stream.take(10);
  stream.listen((event) {
    print('List 1: $event');
  });

  stream.listen((event) {
    print('List 2: $event');
  });

  print('finish');
}

int callback(int value) {
  print('callback: $value');
  return (value + 1) * 2;
}
