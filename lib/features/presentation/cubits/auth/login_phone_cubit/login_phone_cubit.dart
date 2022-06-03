import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wallet_ui/features/domain/usecases/auth/login_case.dart';

part 'login_phone_cubit.freezed.dart';

class LoginPhoneCubit extends Cubit<LoginPhoneState> {
  final LoginCase loginCase;
  LoginPhoneCubit({required this.loginCase}) : super(LoginPhoneState.initial());

  generateCode({required String phoneNumber}) async {
    emit(LoginPhoneState.loading());
    final response = await loginCase.generateCode(phoneNumber: phoneNumber);
    if (response.error == null) {
      emit(LoginPhoneState.loaded(code: response.code!));
    } else {
      emit(LoginPhoneState.failed(error: response.error!.message));
    }
  }
}

@freezed
class LoginPhoneState with _$LoginPhoneState {
  const factory LoginPhoneState.initial() = _Initial;
  const factory LoginPhoneState.loading() = _Loading;
  const factory LoginPhoneState.loaded({required String code}) = _Loaded;
  const factory LoginPhoneState.failed({required String error}) = _Failed;
}
