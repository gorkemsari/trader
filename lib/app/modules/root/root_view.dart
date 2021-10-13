import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trader/app/routes/app_pages.dart';

import 'root_controller.dart';

class RootView extends StatelessWidget {
  RootView({
    Key? key,
  }) : super(key: key);

  final controller = Get.find<RootController>();

  @override
  Widget build(BuildContext context) {
    return GetRouterOutlet.builder(
      builder: (context, delegate, currentRoute) {
        //final title = currentRoute?.location;
        var selectedIndex = currentIndex(currentRoute?.location);

        return Scaffold(
          body: GetRouterOutlet(
            anchorRoute: Routes.root,
            initialRoute: Routes.market,
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
                  if (controller.previousIndex == index) {
                    //todo: jump to scroll top.
                  } else {
                    controller.previousIndex = index;
                    delegate.toNamed(Routes.market);
                  }
                  break;
                case 1:
                  if (controller.previousIndex == index) {
                    //todo: jump to scroll top.
                  } else {
                    controller.previousIndex = index;
                    delegate.toNamed(Routes.alarm);
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
    if (currentRoute?.startsWith(Routes.market) == true) {
      return 0;
    } else if (currentRoute?.startsWith(Routes.alarm) == true) {
      return 1;
    }

    return 0;
  }
}
