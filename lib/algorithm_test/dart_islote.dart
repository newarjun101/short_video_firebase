import 'dart:isolate';

void dartIsolateTest() async {
  final receivePort = ReceivePort();
  // 2
  final isolate = await Isolate.spawn(
    dowloadAndCompressTheInternet,
    receivePort.sendPort,
  );
  receivePort.listen((message) {
    print(message);
    receivePort.close();
    isolate.kill();
  });
}

void dowloadAndCompressTheInternet(SendPort sendPort) {
  sendPort.send(42);
}
