import 'package:wallet_ui/core/app_error.dart';
import 'package:wallet_ui/features/data/repository/repository.dart';
import 'package:wallet_ui/features/domain/repositories/repo_transfer_money/repo_transfer_money.dart';

class TransferMoneyRepository extends RepoTransferMoney {
  final Repository repository;

  TransferMoneyRepository({required this.repository});

  @override
  Future<RepoTransferMoneyResult> transferMoney({
    required String receiver,
    required int walletId,
    required String amount,
  }) async {
    final response = await repository.transferMoneyApi.transferMoney(
      receiver: receiver,
      walletId: walletId,
      amount: amount,
    );

    if (response.error == null) {
      return RepoTransferMoneyResult(result: response.result);
    }

    return RepoTransferMoneyResult(
      error: AppError(message: response.error!.message),
    );
  }
}
