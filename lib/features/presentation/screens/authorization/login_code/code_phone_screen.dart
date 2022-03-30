import 'package:flutter/material.dart';
import 'package:wallet_ui/core/styles.dart';
import 'package:wallet_ui/features/presentation/screens/authorization/login_face_id/face_id_phone_screen.dart';
import 'package:wallet_ui/features/presentation/widgets/app_logo.dart';
import 'package:wallet_ui/features/presentation/widgets/custom_button.dart';
import 'package:wallet_ui/features/presentation/widgets/custom_text_field.dart';
import 'package:wallet_ui/core/input_text_formatters.dart' as formatters;



part 'parts/code_phone_form.dart';

class LoginCodeScreen extends StatelessWidget {
  const LoginCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.backgroundColor,
      body: InkWell(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: Container(
            height: Styles.getHeight(context),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CodePhoneForm(),
          ),
        ),
      ),
    );
  }
}

// class LoginPhoneScreen extends StatelessWidget {
//   LoginPhoneScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Styles.backgroundColor,
//       body: InkWell(
//         onTap: () => FocusScope.of(context).unfocus(),
//         child: SafeArea(
//           child: Container(
//             height: Styles.getHeight(context),
//             padding: const EdgeInsets.symmetric(horizontal: 16),
//             child: LoginPhoneForm(),
//           ),
//         ),
//       ),
//     );
//   }
// }