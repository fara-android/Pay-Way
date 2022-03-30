part of '../face_id_phone_screen.dart';

class FaceIdPhoneForm extends StatefulWidget {
  FaceIdPhoneForm({Key? key}) : super(key: key);

  @override
  State<FaceIdPhoneForm> createState() => _FaceIdPhoneFormState();
}

class _FaceIdPhoneFormState extends State<FaceIdPhoneForm> {
  late FocusNode focusNode;

  @override
  void initState() {
    focusNode = FocusNode();
    focusNode.requestFocus();
    super.initState();
  }

  @override
  void dispose() {
    focusNode.unfocus();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacer(),
          AppLogo(width: 120, height: 120),
          SizedBox(height: 22),
          Text(
            "Войти",
            style: Styles.ts32(
              Styles.textColor,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 8),
          Text(
            "Придумайте PIN или используйте FaceID",
            style: Styles.ts14(
              Styles.textColor,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 40),
          Text(
            "Введите PIN код".toUpperCase(),
            style: Styles.ts12(Styles.textColor2, fontWeight: FontWeight.w400),
          ),
          CustomTextField(
            hintText: "xxxx",
            focusNode: focusNode,
            textInputType: TextInputType.phone,
            inputFormatters: [formatters.pinFormatter],
            onChange: (text) {},
            obscureeText: true,
          ),
          SizedBox(height: 16),
          Spacer(),
          CustomButton(
            text: "Войти",
            // isDisabled: phoneNumberText.value.length != 18,
            isDisabled: false,
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => LoginCodeScreen(),
              //   ),
              // );
            },
            backgroundColor: Styles.brandBlue,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Использовать FaceID для входа",
                style: Styles.ts14(
                  Styles.textColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Switch(
                value: true,
                onChanged: (value) {},
              )
            ],
          ),
          SizedBox(height: 12),
        ],
      ),
    );
  }
}
