import 'package:state_management/home/model/all_currencies_model.dart';
import 'package:state_management/home/model/currency_model.dart';

abstract class CurencyApiInterface {
  Future<List<CurrencyModel>> getCurrency();
}
