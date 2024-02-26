void main() async {
  print('init');
  final interval = Duration(seconds: 2);
  final stream = Stream<int>.periodic(interval, callback);

  await for (var i in stream) {
    print(i);
  }

  print('finish');
}

int callback(int value) {
  return (value + 1) * 2;
}
