import 'package:wallet_ui/features/domain/repositories/repo_history_payments/repo_history_payments.dart';

class HistoryPaymentsCase {
  final RepoHistoryPayments repository;

  HistoryPaymentsCase({required this.repository});

  Future<RepoHistoryPaymentsResult> getHistoryPayments() async {
    final response = await repository.getHistoryPayments();

    return response;
  }
}
