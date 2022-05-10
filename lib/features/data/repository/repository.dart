import 'package:dio/dio.dart';
import 'package:wallet_ui/features/data/data_sources/api_data_source/history_payments_api.dart';
import 'package:wallet_ui/features/data/data_sources/api_data_source/login_email_api.dart';
import 'package:wallet_ui/features/data/data_sources/helpers/dio_settings.dart';

class Repository {
  Repository() {
    _dio = _getDio();
    loginEmailApi = LoginEmailApi(dio: _dio);
    historyPaymentsApi = HistoryPaymentsApi(dio: _dio);
  }

  late Dio _dio;
  late LoginEmailApi loginEmailApi;
  late HistoryPaymentsApi historyPaymentsApi;
}

Dio _getDio() {
  final apiSettings = DioSettings();

  return apiSettings.dio;
}
