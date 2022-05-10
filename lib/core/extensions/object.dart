import 'package:dio/dio.dart';

extension DioErrorUtils on Object {
  String get dioErrorMessage {
    var output = 'Что то пошло не так';

    if (this is! DioError) return output;
    final error = this as DioError;
    if (error.response?.statusCode == 422) {
      final Map? errorsMap = error.response?.data['errors'];
      if (errorsMap == null) return output;
      for (var item in errorsMap.values) {
        for (var e in item) {
          output = e;
        }
      }
    }

    if (error.response?.statusCode == 401) {
      final errorMessage = error.response?.data['message'];
      if (errorMessage == null) return output;
      output = errorMessage;
    }
    return output;
  }

  int? get dioErrorStatusCode {
    int? output;

    if (this is! DioError) return output;
    if ((this as DioError).type == DioErrorType.other) return 520;
    return (this as DioError).response?.statusCode;
  }
}
