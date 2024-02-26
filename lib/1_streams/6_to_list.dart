void main() async {
  print('init');
  final interval = Duration(seconds: 2);
  var stream = Stream<int>.periodic(interval, callback);

  stream = stream.take(5);

  var data = await stream.toList();
  print(data);

  print('finish');
}

int callback(int value) {
  print('callback: $value');
  return (value + 1) * 2;
}
