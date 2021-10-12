part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const ROOT = _Paths.ROOT;

  // alarm
  static const ALARM = _Paths.ALARM;
  static const ALARM_ADD = _Paths.ALARM + _Paths.ALARM_ADD;
  static const ALARM_DETAIL = _Paths.ALARM + _Paths.ALARM_DETAIL;
  //static String BLOG_DETAIL({required String id}) => '$BLOG/$id';

  // market
  static const MARKET = _Paths.MARKET;
}

abstract class _Paths {
  // root
  static const ROOT = '/';

  // alarm
  static const ALARM = '/alarm';
  static const ALARM_ADD = '/add';
  static const ALARM_DETAIL = '/:id';

  // market
  static const MARKET = '/market';
}