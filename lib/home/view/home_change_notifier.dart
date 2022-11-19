import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:state_management/home/controller/currency_controller.dart';
import 'package:state_management/shared/util/app_dependencies.dart';

class HomePageChangeNotifier extends StatelessWidget {
  HomePageChangeNotifier({Key? key}) : super(key: key);

  final CurrencyController controller = getIt<CurrencyController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Center(
          child: AnimatedBuilder(
            animation: controller,
            builder: (context, _) {
              return ListView.builder(
                itemBuilder: ((context, index) {
                  final item = controller.onlineList[index];

                  return Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              controller.manageItem(item);
                              log('tamanho da lista offline: ${controller.offlineList.length}');
                            },
                            icon: controller.offlineList.contains(item)
                                ? const Icon(Icons.star)
                                : const Icon(Icons.star_border),
                          ),
                          Text(item.currency),
                          const SizedBox(width: 20),
                          Text('R\$${item.value}'),
                        ],
                      ),
                      const Divider(thickness: 2)
                    ],
                  );
                }),
                itemCount: controller.onlineList.length,
              );
              // return SingleChildScrollView(
              //   child: Column(
              //     children: controller.onlineList
              //         .map(
              //           (e) => Column(
              //             children: [
              //               Row(
              //                 children: [
              //                   IconButton(
              //                     onPressed: () {
              //                       controller.manageItem(e);
              //                       log('tamanho da lista offline: ${controller.offlineList.length}');
              //                     },
              //                     icon: controller.offlineList.contains(e)
              //                         ? const Icon(Icons.star)
              //                         : const Icon(Icons.star_border),
              //                   ),
              //                   Text(e.currency),
              //                   const SizedBox(width: 20),
              //                   Text('R\$${e.value}'),
              //                 ],
              //               ),
              //               const Divider(thickness: 2)
              //             ],
              //           ),
              //         )
              //         .toList(),
              //     // .map(
              //     //   (e) => CheckboxListTile(
              //     //     value: false,
              //     //     onChanged: ((value) {
              //     //       value = true;
              //     //     }),
              //     //     title: Card(child: Text(e.currency)),
              //     //   ),
              //     // )
              //     // .toList(),
              //   ),
              // );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: AnimatedBuilder(
          animation: controller,
          builder: (context, _) {
            return Text(controller.offlineList.length.toString());
          },
        ),
        onPressed: () {},
      ),
    );
  }
}
