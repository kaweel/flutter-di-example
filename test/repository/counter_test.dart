import 'package:flutter_di/inject.dart';
import 'package:flutter_di/models/counter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_di/repository/counter.dart';
import 'package:mockito/mockito.dart';

void main() {
  setUpAll(() {
    configureInjection(Env.unit_test);
  });

  test('Counter increase should return counter + 1', () {
    final counterRepository = getIt<CounterRepository>();
    when(counterRepository.increment()).thenReturn(1);
    var counterModel = CounterModel(counterRepository);
    var before = counterModel.counter;
    counterModel.increment();
    var after = counterModel.counter;
    expect(before, equals(0));
    verify(counterRepository.increment()).called(1);
    expect(before + 1, equals(after));
  });

  test('Counter decrease should return counter - 1', () {
    final counterRepository = getIt<CounterRepository>();
    when(counterRepository.decrement()).thenReturn(1);
    var counterModel = CounterModel(counterRepository);
    var before = counterModel.counter;
    counterModel.decrement();
    var after = counterModel.counter;
    expect(before, equals(0));
    verify(counterRepository.decrement()).called(1);
    expect(before - 1, equals(after));
  });
}
