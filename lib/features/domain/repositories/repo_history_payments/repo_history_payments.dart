import 'package:wallet_ui/core/app_error.dart';
import 'package:wallet_ui/features/data/models/history/history_payment_model.dart';

abstract class RepoHistoryPayments {
  Future<RepoHistoryPaymentsResult> getHistoryPayments();
}

class RepoHistoryPaymentsResult {
  RepoHistoryPaymentsResult({
    this.error,
    this.historyPaymentModel,
  });

  final AppError? error;
  final HistoryPaymentModel? historyPaymentModel;

  @override
  String toString() =>
      'RepoAuthResult(error: $error, result: ${historyPaymentModel?.data})';
}
