import 'dart:async';

Future<void> main() async {
  print('init');
  final streamController = StreamController<Person>.broadcast();
  final inStream = streamController.sink;
  final outStream = streamController.stream;

  outStream.listen(print);

  var numbers = List.generate(5, (index) => index);
  for (final i in numbers) {
    print('Send $i');
    inStream.add(Person('Anderson Vinicius $i'));
  }

  await streamController.close();
  print('finish');
}

class Person {
  String name;

  Person(this.name);

  @override
  String toString() {
    return 'Person{name: $name}';
  }
}
