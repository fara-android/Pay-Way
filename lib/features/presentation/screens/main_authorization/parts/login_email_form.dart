part of '../login_email_screen.dart';

class LoginEmailForm extends StatefulWidget {
  LoginEmailForm({Key? key}) : super(key: key);

  @override
  State<LoginEmailForm> createState() => _LoginEmailFormState();
}

class _LoginEmailFormState extends State<LoginEmailForm> {
  final emailController = TextEditingController(text: 'sifecs115@gmail.com');
  final passwordController = TextEditingController(text: 'sifecs1111115');
  final ValueNotifier<bool> isLoadingNotofier = ValueNotifier(false);
  final ValueNotifier<bool> isObscureNotofier = ValueNotifier(true);
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Spacer(),
        SizedBox(height: 42),
        Text(
          "Войти",
          style: Styles.ts32(
            Styles.textColor,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 40),
        CustomTextField(
          hintText: 'e-mail',
          focusNode: focusNode,
          textInputType: TextInputType.emailAddress,
          controller: emailController,
        ),
        SizedBox(height: 12),
        ValueListenableBuilder(
          valueListenable: isObscureNotofier,
          builder: (context, str, _) {
            return CustomTextField(
              hintText: "Пароль",
              textInputType: TextInputType.visiblePassword,
              controller: passwordController,
              obscureeText: isObscureNotofier.value,
              suffixIcon: isObscureNotofier.value
                  ? IconButton(
                      onPressed: () => isObscureNotofier.value = false,
                      icon: Icon(
                        Icons.visibility_off,
                        color: Styles.white,
                      ),
                    )
                  : IconButton(
                      onPressed: () => isObscureNotofier.value = true,
                      icon: Icon(
                        Icons.visibility,
                        color: Styles.white,
                      ),
                    ),
            );
          },
        ),
        SizedBox(height: 16),
        Spacer(),
        BlocListener<LoginEmailCubit, LoginEmailState>(
          listener: (context, state) {
            state.maybeWhen(
              orElse: () {},
              loading: () => isLoadingNotofier.value = true,
              loginSuccess: (_) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Menu()),
                  (route) => false,
                );
              },
              loginFailed: (error) {
                isLoadingNotofier.value = false;
                AppToasts().showBottomToast(error, context, true);
              },
            );
          },
          child: ValueListenableBuilder(
            valueListenable: isLoadingNotofier,
            builder: (context, str, _) {
              return CustomButton(
                loading: isLoadingNotofier.value,
                text: "Войти",
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  BlocProvider.of<LoginEmailCubit>(context).login(
                    email: emailController.text,
                    password: passwordController.text,
                  );
                },
                backgroundColor: Styles.brandBlue,
              );
            },
          ),
        ),
        SizedBox(height: 32),
      ],
    );
  }
}
