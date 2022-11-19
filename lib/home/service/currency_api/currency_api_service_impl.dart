import 'package:state_management/home/model/currency_model.dart';
import 'package:state_management/home/service/currency_api/interface/currency_api_interface.dart';
import 'package:state_management/shared/client/interface/api_client_interface.dart';
import 'package:state_management/shared/util/app_urls.dart';

class CurrencyApiServiceImpl implements CurencyApiInterface {
  final ApiClientInterface clientInterface;

  CurrencyApiServiceImpl({required this.clientInterface});

  @override
  Future<List<CurrencyModel>> getCurrency() async {
    final response = await clientInterface.get('${AppUrls.baseUrl}');

    switch (response.statusCode) {
      case 200:
        // inspect(response.data);
        // {
        //  "a": { 'value' : 2 },
        //  "b": { 'value' : 2 },
        // }
        final data = Map<String, Map<String, dynamic>>.from(
          response.data,
        ).values;
        return data.map((e) => CurrencyModel.fromJson(e)).toList();

      // final jsonList = List<Map<String, dynamic>>.from(response.data);
      // final models = jsonList.map(AllCurrenciesModel.fromJson).toList();

      // return models;
      default:
        throw Exception();
    }
  }
}
