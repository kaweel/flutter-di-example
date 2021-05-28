import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'inject.config.dart';

final getIt = GetIt.instance;

// กำหนดตัวสำหรับตั้งค่า get_it
// ฟังก์ชันที่ชื่อ $initGetIt จะถูกสร้างเมื่อเราสั่ง build_runner
@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
void configureInjection(String environment) =>
    $initGetIt(getIt, environment: environment);

// กำหนดว่าอยากให้มี Environment อะไรบ้างตามแต่ใจของเราเลย
abstract class Env {
  static const unit_test = 'unit_test';
  static const dev = 'dev';
  static const prod = 'prod';
}
