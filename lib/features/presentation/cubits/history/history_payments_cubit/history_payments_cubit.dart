import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wallet_ui/features/data/models/history/history_payment_model.dart';
import 'package:wallet_ui/features/domain/usecases/history/history_payments_case.dart';

part 'history_payments_cubit.freezed.dart';

class HistoryPaymentsCubit extends Cubit<HistoryPaymentsState> {
  final HistoryPaymentsCase historyPaymentsCase;
  HistoryPaymentsCubit({required this.historyPaymentsCase})
      : super(HistoryPaymentsState.initial()) {
    getHistoryPayments();
  }

  getHistoryPayments() async {
    emit(HistoryPaymentsState.loading());
    final response = await historyPaymentsCase.getHistoryPayments();
    if (response.error == null) {
      emit(
        HistoryPaymentsState.success(
            historyPaymentModel: response.historyPaymentModel!),
      );
    } else {
      emit(HistoryPaymentsState.failed(error: response.error!.message));
    }
  }
}

@freezed
class HistoryPaymentsState with _$HistoryPaymentsState {
  const factory HistoryPaymentsState.initial() = _Initial;
  const factory HistoryPaymentsState.loading() = _Loading;
  const factory HistoryPaymentsState.success(
      {required HistoryPaymentModel historyPaymentModel}) = _Success;
  const factory HistoryPaymentsState.failed({required String error}) = _Failed;
}
