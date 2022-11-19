class CurrencyModel {
  String currency; //sigla da moeda
  String value; //cotação
  String time; //data e hora da requisição

  CurrencyModel({
    required this.currency,
    required this.value,
    required this.time,
  });

  factory CurrencyModel.fromJson(Map<String, dynamic> json) {
    return CurrencyModel(
      currency: json['code'],
      value: json['high'],
      time: json['create_date'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['code'] = currency;
    data['high'] = value;
    data['create_date'] = time;

    return data;
  }
}
