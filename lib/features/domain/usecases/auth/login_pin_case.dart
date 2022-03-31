import 'package:shared_preferences/shared_preferences.dart';

class LoginPinCase {
  final SharedPreferences preferences;

  LoginPinCase({required this.preferences});

  String savePinCode({
    required String pinCode,
    required bool useAutenthication,
  }) {
    preferences.setString('pinCode', pinCode);
    preferences.setBool('useAuthentication', useAutenthication);

    return 'success';
  }
}
