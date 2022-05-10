import 'package:dio/dio.dart';
import 'package:wallet_ui/core/app_error.dart';
import 'package:wallet_ui/features/data/models/history/history_payment_model.dart';
import 'package:wallet_ui/features/domain/repositories/repo_history_payments/repo_history_payments.dart';
import 'package:wallet_ui/core/extensions/object.dart';

class HistoryPaymentsApi {
  final Dio dio;

  HistoryPaymentsApi({required this.dio});
  Future<RepoHistoryPaymentsResult> gethistoryPayments() async {
    try {
      final response = await dio.get('transactions');
      return RepoHistoryPaymentsResult(
          historyPaymentModel: HistoryPaymentModel.fromJson(response.data));
    } catch (e) {
      return RepoHistoryPaymentsResult(
          error: AppError(message: e.dioErrorMessage));
    }
  }
}
