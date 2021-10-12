import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trader/app/modules/alarm/list/alarm_list_controller.dart';
import 'package:trader/app/modules/market/list/market_list_controller.dart';
import 'package:trader/app/routes/app_pages.dart';

import 'root_controller.dart';

class RootView extends StatelessWidget {
  RootView({
    Key? key,
  }) : super(key: key);

  final controller = Get.find<RootController>();
  var previousIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GetRouterOutlet.builder(
      builder: (context, delegate, currentRoute) {
        final title = currentRoute?.location;
        var selectedIndex = currentIndex(currentRoute?.location);

        return Scaffold(
          body: GetRouterOutlet(
            anchorRoute: Routes.ROOT,
            initialRoute: Routes.MARKET,
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: selectedIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: 'Piyasa',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.alarm),
                label: 'Alarm',
              ),
            ],
            onTap: (index) {
              switch (index) {
                case 0:
                  if (previousIndex == index) {
                    final controller = Get.find<MarketListController>();
                    //controller.jumpToTop();
                  } else {
                    previousIndex = index;
                    delegate.toNamed(Routes.MARKET);
                  }
                  break;
                case 1:
                  if (previousIndex == index) {
                    final controller = Get.find<AlarmListController>();
                    //controller.jumpToTop();
                  } else {
                    previousIndex = index;
                    delegate.toNamed(Routes.ALARM);
                  }
                  break;
              }
            },
          ),
        );
      },
    );
  }

  int currentIndex(String? currentRoute) {
    if (currentRoute?.startsWith(Routes.MARKET) == true) {
      return 0;
    } else if (currentRoute?.startsWith(Routes.ALARM) == true) {
      return 1;
    }

    return 0;
  }
}
