void main() async {
  print('init');
  final interval = Duration(seconds: 2);
  var stream = Stream<int>.periodic(interval, callback);

  stream = stream.where((value) => value < 5);
  stream.listen((event) {
    print(event);
  });

  print('finish');
}

int callback(int value) {
  print('callback: $value');
  return (value + 1) * 2;
}
