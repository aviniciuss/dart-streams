import 'dart:async';

Future<void> main() async {
  print('init');
  final streamController = StreamController<int>.broadcast();
  final inStream = streamController.sink;
  final outStream = streamController.stream;

  outStream
      .skip(1)
      .where((number) => number % 2 == 0)
      .map((value) => 'Value is $value')
      .listen(print);

  var numbers = List.generate(20, (index) => index);
  for(final i in numbers) {
    inStream.add(i);
    await Future.delayed(Duration(milliseconds: 500));
  }

  await streamController.close();
  print('finish');
}
