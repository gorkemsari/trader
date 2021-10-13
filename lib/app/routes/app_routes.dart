part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const root = _Paths.root;

  // alarm
  static const alarm = _Paths.alarm;
  static const alarmAdd = _Paths.alarm + _Paths.alarmAdd;

  // market
  static const market = _Paths.market;
}

abstract class _Paths {
  // root
  static const root = '/';

  // alarm
  static const alarm = '/alarm';
  static const alarmAdd = '/add';

  // market
  static const market = '/market';
}