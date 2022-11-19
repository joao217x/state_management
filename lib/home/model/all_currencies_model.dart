import 'package:state_management/home/model/currency_model.dart';

class AllCurrenciesModel {
  CurrencyModel usDollar;
  CurrencyModel ausDollar;
  CurrencyModel cadDollar;
  CurrencyModel euro;
  CurrencyModel yenJp;
  CurrencyModel pound;
  CurrencyModel yuanCh;

  AllCurrenciesModel({
    required this.usDollar,
    required this.ausDollar,
    required this.cadDollar,
    required this.euro,
    required this.yenJp,
    required this.pound,
    required this.yuanCh,
  });

  factory AllCurrenciesModel.fromJson(Map<String, dynamic> json) {
    return AllCurrenciesModel(
      usDollar: CurrencyModel.fromJson(json['USDBRL']),
      ausDollar: CurrencyModel.fromJson(json['AUDBRL']),
      cadDollar: CurrencyModel.fromJson(json['CADBRL']),
      euro: CurrencyModel.fromJson(json['EURBRL']),
      yenJp: CurrencyModel.fromJson(json['JPYBRL']),
      pound: CurrencyModel.fromJson(json['GBPBRL']),
      yuanCh: CurrencyModel.fromJson(json['CNYBRL']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['USDBRL'] = usDollar.toJson();
    data['AUDBRL'] = ausDollar.toJson();
    data['CADBRL'] = cadDollar.toJson();
    data['EURBRL'] = euro.toJson();
    data['JPYBRL'] = yenJp.toJson();
    data['GBPBRL'] = pound.toJson();
    data['CNYBRL'] = yuanCh.toJson();

    return data;
  }
}
