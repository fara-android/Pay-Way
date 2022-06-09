import 'package:dio/dio.dart';
import 'package:wallet_ui/features/data/data_sources/api_data_source/history_payments_api.dart';
import 'package:wallet_ui/features/data/data_sources/api_data_source/login_api.dart';
import 'package:wallet_ui/features/data/data_sources/api_data_source/login_email_api.dart';
import 'package:wallet_ui/features/data/data_sources/api_data_source/register_api.dart';
import 'package:wallet_ui/features/data/data_sources/api_data_source/transfer_money_api.dart';
import 'package:wallet_ui/features/data/data_sources/api_data_source/user_api.dart';
import 'package:wallet_ui/features/data/data_sources/helpers/dio_settings.dart';

class Repository {
  Repository() {
    _dio = _getDio();
    loginEmailApi = LoginEmailApi(dio: _dio);
    historyPaymentsApi = HistoryPaymentsApi(dio: _dio);
    transferMoneyApi = TransferMoneyApi(dio: _dio);
    userApi = UserApi(dio: _dio);
    loginApi = LoginApi(dio: _dio);
    registerUserApi = RegisterUserApi(dio: _dio);
  }

  late Dio _dio;
  late LoginEmailApi loginEmailApi;
  late HistoryPaymentsApi historyPaymentsApi;
  late TransferMoneyApi transferMoneyApi;
  late UserApi userApi;
  late LoginApi loginApi;
  late RegisterUserApi registerUserApi;
}

Dio _getDio() {
  final apiSettings = DioSettings();

  return apiSettings.dio;
}
