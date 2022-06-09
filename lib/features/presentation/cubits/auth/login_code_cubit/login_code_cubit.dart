import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wallet_ui/features/data/models/user/user_model.dart';
import 'package:wallet_ui/features/domain/usecases/auth/login_case.dart';

part 'login_code_cubit.freezed.dart';

class LoginCodeCubit extends Cubit<LoginCodeState> {
  final LoginCase loginCase;
  LoginCodeCubit({required this.loginCase}) : super(LoginCodeState.initial());

  verifyCode({
    required String phoneNumber,
    required String code,
  }) async {
    emit(LoginCodeState.loading());
    final response =
        await loginCase.verifyCode(phoneNumber: phoneNumber, code: code);
    if (response.error == null) {
      emit(LoginCodeState.loaded(user: response.user!));
    } else {
      emit(LoginCodeState.failed(error: response.error!.message));
    }
  }
}

@freezed
class LoginCodeState with _$LoginCodeState {
  const factory LoginCodeState.initial() = _Initial;
  const factory LoginCodeState.loading() = _Loading;
  const factory LoginCodeState.loaded({required UserModel user}) = _Loaded;
  const factory LoginCodeState.failed({required String error}) = _Failed;
}
