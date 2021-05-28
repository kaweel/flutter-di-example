import 'package:flutter_di/inject.dart';
import 'package:injectable/injectable.dart';
import 'package:mockito/mockito.dart';

const unit_test = Env.unit_test;
const dev = Env.dev;
const prod = Env.prod;

abstract class CounterRepository {
  int? increment();
  int? decrement();
}

@Injectable(as: CounterRepository, env: [unit_test])
class MockCounterRepositoryImpl extends Mock implements CounterRepository {}

@Injectable(as: CounterRepository, env: [dev])
class DevCounterRepositoryImpl implements CounterRepository {
  @override
  int? increment() => 10;

  @override
  int? decrement() => 10;
}

@Injectable(as: CounterRepository, env: [prod])
class CounterRepositoryImpl implements CounterRepository {
  @override
  int? increment() => 1;

  @override
  int? decrement() => 1;
}
