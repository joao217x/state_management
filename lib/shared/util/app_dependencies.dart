import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:state_management/home/controller/currency_controller.dart';
import 'package:state_management/home/service/currency_api/currency_api_service_impl.dart';
import 'package:state_management/home/service/currency_api/interface/currency_api_interface.dart';
import 'package:state_management/shared/client/dio_impl.dart';
import 'package:state_management/shared/client/interface/api_client_interface.dart';

GetIt getIt = GetIt.instance;

class AppDependencies {
  void setup() {
    //Dio lib
    getIt.registerFactory<Dio>(() => Dio());

    //Api interface
    getIt.registerFactory<ApiClientInterface>(
      () => DioImpl(client: getIt<Dio>()),
    );

    //Currency api interface
    getIt.registerFactory<CurencyApiInterface>(() {
      return CurrencyApiServiceImpl(
        clientInterface: getIt<ApiClientInterface>(),
      );
    });

    // Controller
    getIt.registerFactory<CurrencyController>(
      () => CurrencyController(currencyInterface: getIt<CurencyApiInterface>()),
    );

    // getIt.registerFactory<CurrencyApiServiceImpl>(() => );
  }
}
