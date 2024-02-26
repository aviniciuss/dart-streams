void main() async {
  print('init');
  final interval = Duration(seconds: 2);
  var stream = Stream<int>.periodic(interval, callback);

  stream = stream.takeWhile((int value) => value < 10);
  await for (var i in stream) {
    print(i);
  }

  print('finish');
}

int callback(int value) {
  return (value + 1) * 2;
}
