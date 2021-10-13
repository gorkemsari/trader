import 'package:get/get.dart';
import 'package:trader/app/modules/alarm/add/alarm_add_binding.dart';
import 'package:trader/app/modules/alarm/add/alarm_add_view.dart';
import 'package:trader/app/modules/alarm/list/alarm_list_binding.dart';
import 'package:trader/app/modules/alarm/list/alarm_list_middleware.dart';
import 'package:trader/app/modules/alarm/list/alarm_list_view.dart';
import 'package:trader/app/modules/market/list/market_list_binding.dart';
import 'package:trader/app/modules/market/list/market_list_middleware.dart';
import 'package:trader/app/modules/market/list/market_list_view.dart';
import 'package:trader/app/modules/root/root_binding.dart';
import 'package:trader/app/modules/root/root_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
        name: _Paths.root,
        page: () => RootView(),
        binding: RootBinding(),
        preventDuplicates: true,
        participatesInRootNavigator: true,
        children: [
          GetPage(
            title: 'Alarm list',
            name: _Paths.alarm,
            page: () => const AlarmListView(),
            binding: AlarmListBinding(),
            middlewares: [
              AlarmListMiddleware(),
            ],
            children: [
              GetPage(
                title: 'Alarm add',
                name: _Paths.alarmAdd,
                page: () => AlarmAddView(),
                binding: AlarmAddBinding(),
              ),
            ],
          ),
          GetPage(
            title: 'Market list',
            name: _Paths.market,
            page: () => const MarketListView(),
            binding: MarketListBinding(),
            middlewares: [
              MarketListMiddleware(),
            ],
          ),
        ]),
  ];
}
