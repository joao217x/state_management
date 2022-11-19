import 'package:flutter/cupertino.dart';
import 'package:state_management/home/model/currency_model.dart';
import 'package:state_management/home/service/currency_api/interface/currency_api_interface.dart';

class CurrencyController extends ChangeNotifier {
  final CurencyApiInterface currencyInterface;
  // final CurrencyApiServiceImpl currencyService;
  List<CurrencyModel> onlineList = [];
  List<CurrencyModel> offlineList = [];

  CurrencyController({required this.currencyInterface}) {
    getCurrency();
  }

  // CHANGE NOTIFIER NÃO PRECISA DE RETORNO
  // Future<void> getCurrency() async {
  //   try {
  //     final response = await currencyInterface.getCurrency();
  //     onlineList = response;
  //     notifyListeners();
  //   } catch (_) {
  //     onlineList = [];
  //     notifyListeners();
  //   }
  // }

  Future<List<CurrencyModel>> getCurrency() async {
    try {
      final response = await currencyInterface.getCurrency();
      onlineList = response;
      notifyListeners();

      return onlineList;
    } catch (_) {
      notifyListeners();
      return [];
    }
  }

  void manageItem(CurrencyModel item) {
    if (offlineList.contains(item)) {
      offlineList.remove(item);
    } else {
      offlineList.add(item);
    }
    notifyListeners();
  }

  // int checkListSize() {
  //   notifyListeners();
  //   return offlineList.length;
  // }
}
