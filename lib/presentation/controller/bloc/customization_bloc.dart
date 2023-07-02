import 'dart:async';

class ColorForBloC {
  final dataController = StreamController<int>();

  Stream<int> get dataStream => dataController.stream;
  Sink<int> get dataSink => dataController.sink;
}

class OrientationForBloC {
  final dataController = StreamController<int>();
  Stream<int> get dataStream => dataController.stream;
  Sink<int> get dataSink => dataController.sink;
}

class SortByForBloC {
  final dataController = StreamController<int>();
  Stream<int> get dataStream => dataController.stream;
  Sink<int> get dataSink => dataController.sink;
}

class QualityForBloC {
  final dataController = StreamController<int>();
  Stream<int> get dataStream => dataController.stream;
  Sink<int> get dataSink => dataController.sink;
}
