import 'package:flutter/foundation.dart';
import 'package:flutter_di/repository/counter.dart';
import 'package:injectable/injectable.dart';

@injectable
class CounterModel extends ChangeNotifier {
  final CounterRepository _counterRepository;
  int _counter = 0;

  get counter => _counter;

  CounterModel(this._counterRepository);

  increment() {
    _counter += _counterRepository.increment()!;
    notifyListeners();
  }

  decrement() {
    _counter -= _counterRepository.decrement()!;
    notifyListeners();
  }
}
