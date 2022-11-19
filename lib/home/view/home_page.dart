import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:state_management/home/controller/currency_controller.dart';
import 'package:state_management/home/model/currency_model.dart';
import 'package:state_management/shared/util/app_dependencies.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final CurrencyController controller = getIt<CurrencyController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Center(
          child: FutureBuilder<List<CurrencyModel>>(
            future: controller.getCurrency(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                const Text('deu ruim');
              }
              if (snapshot.hasData) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  controller.manageItem(snapshot.data![index]);
                                  log('tamanho da lista offline: ${controller.offlineList.length}');
                                },
                                icon: controller.offlineList
                                        .contains(snapshot.data![index])
                                    ? const Icon(Icons.star)
                                    : const Icon(Icons.star_border),
                              ),
                              Text(snapshot.data?[index].currency ?? 'Erro'),
                              const SizedBox(width: 16),
                              Text('R\$${snapshot.data?[index].value}'),
                            ],
                          ),
                        ),
                      ),
                    );
                    // return CurrencyCard(currency: snapshot.data![index]);
                  },
                  itemCount: snapshot.data!.length,
                );
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
