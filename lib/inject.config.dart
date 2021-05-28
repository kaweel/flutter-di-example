// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'models/counter.dart' as _i4;
import 'repository/counter.dart' as _i3;

const String _unit_test = 'unit_test';
const String _dev = 'dev';
const String _prod = 'prod';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.CounterRepository>(() => _i3.MockCounterRepositoryImpl(),
      registerFor: {_unit_test});
  gh.factory<_i3.CounterRepository>(() => _i3.DevCounterRepositoryImpl(),
      registerFor: {_dev});
  gh.factory<_i3.CounterRepository>(() => _i3.CounterRepositoryImpl(),
      registerFor: {_prod});
  gh.factory<_i4.CounterModel>(
      () => _i4.CounterModel(get<_i3.CounterRepository>()));
  return get;
}
