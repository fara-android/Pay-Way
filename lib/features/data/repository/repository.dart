import 'package:dio/dio.dart';
import 'package:wallet_ui/features/data/data_sources/helpers/dio_settings.dart';

class Repository {
  Repository() {
    _dio = _getDio();
  }

  late Dio _dio;
}

Dio _getDio() {
  final apiSettings = DioSettings();
  return apiSettings.dio;
}
