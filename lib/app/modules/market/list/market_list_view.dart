import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'market_list_controller.dart';

class MarketListView extends GetView<MarketListController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Piyasa'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.only(
                    left: 32.0, right: 0.0, top: 0.0, bottom: 0.0),
                child: const Text('İsim'),
              ),
              Container(
                padding: const EdgeInsets.only(
                    left: 0.0, right: 32.0, top: 0.0, bottom: 0.0),
                child: const Text('Fiyat'),
              ),
            ],
          ),
          Expanded(
            child: Obx(
              () => RefreshIndicator(
                onRefresh: controller.getList,
                child: ListView.builder(
                  itemCount: controller.usdtList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Container(
                                alignment: Alignment.centerLeft,
                                padding: const EdgeInsets.only(
                                    left: 32.0,
                                    right: 0.0,
                                    top: 0.0,
                                    bottom: 0.0),
                                child: Text(controller.usdtList[index].symbol),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.centerRight,
                                padding: const EdgeInsets.only(
                                    left: 0.0,
                                    right: 32.0,
                                    top: 0.0,
                                    bottom: 0.0),
                                child: Text(controller.usdtList[index].price),
                              ),
                            ),
                            /*Expanded(
                              child: Container(
                                alignment: Alignment.centerRight,
                                padding: const EdgeInsets.only(
                                    left: 0.0,
                                    right: 8.0,
                                    top: 0.0,
                                    bottom: 0.0),
                                child: Text('RSI'),
                              ),
                            ),*/
                          ],
                        ),
                        const Divider(),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
