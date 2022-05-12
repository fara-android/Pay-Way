import 'package:shared_preferences/shared_preferences.dart';
import 'package:wallet_ui/features/domain/repositories/repo_transfer_money/repo_transfer_money.dart';

class TransferMoneyCase {
  final RepoTransferMoney repository;
  final SharedPreferences preferences;
  TransferMoneyCase({
    required this.repository,
    required this.preferences,
  });

  Future<RepoTransferMoneyResult> transferMoney({
    required String receiver,
    required String amount,
  }) async {
    final _walletId = preferences.getInt('walletId');
    final response = await repository.transferMoney(
      receiver: receiver,
      walletId: _walletId!,
      amount: amount,
    );

    return response;
  }
}
