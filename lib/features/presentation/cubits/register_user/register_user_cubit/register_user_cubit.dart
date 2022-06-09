import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wallet_ui/features/data/models/user/register_user_model.dart';
import 'package:wallet_ui/features/data/models/user/user_model.dart';
import 'package:wallet_ui/features/domain/usecases/register_user/register_user_case.dart';

part 'register_user_cubit.freezed.dart';

class RegisterUserCubit extends Cubit<RegisterUserState> {
  final RegisterUserCase registerUserCase;
  RegisterUserCubit({required this.registerUserCase})
      : super(RegisterUserState.initial());

  registerUser(RegisterUserModel registerUserModel) async {
    emit(RegisterUserState.loading());
    final response = await registerUserCase.registerUser(registerUserModel);

    if (response.error == null) {
      emit(RegisterUserState.loaded(response.user!));
    } else {
      emit(RegisterUserState.failed(response.error!.message));
    }
  }
}

@freezed
class RegisterUserState with _$RegisterUserState {
  const factory RegisterUserState.initial() = _Initial;
  const factory RegisterUserState.loading() = _Loading;
  const factory RegisterUserState.loaded(UserModel userModel) = _Loaede;
  const factory RegisterUserState.failed(String error) = _Failed;
}
