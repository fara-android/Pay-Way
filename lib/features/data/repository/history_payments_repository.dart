import 'package:wallet_ui/core/app_error.dart';
import 'package:wallet_ui/features/data/repository/repository.dart';
import 'package:wallet_ui/features/domain/repositories/repo_history_payments/repo_history_payments.dart';

class HistoryPaymentsRepository extends RepoHistoryPayments {
  final Repository repository;

  HistoryPaymentsRepository({required this.repository});
  @override
  Future<RepoHistoryPaymentsResult> getHistoryPayments() async {
    final response = await repository.historyPaymentsApi.gethistoryPayments();

    if (response.error == null) {
      return RepoHistoryPaymentsResult(
        historyPaymentModel: response.historyPaymentModel,
      );
    }

    return RepoHistoryPaymentsResult(
        error: AppError(message: response.error!.message));
  }
}
