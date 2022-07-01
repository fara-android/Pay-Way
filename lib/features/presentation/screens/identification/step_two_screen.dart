import 'package:flutter/material.dart';
import 'package:wallet_ui/core/styles.dart';
import 'package:wallet_ui/features/data/models/user/register_user_model.dart';
import 'package:wallet_ui/features/presentation/screens/identification/step_three_screen.dart';
import 'package:wallet_ui/features/presentation/widgets/app_toasts.dart';
import 'package:wallet_ui/features/presentation/widgets/custom_button.dart';
import 'package:wallet_ui/features/presentation/widgets/custom_drop_down_button.dart';
import 'package:wallet_ui/features/presentation/widgets/custom_text_field.dart';

class StepTwoScreen extends StatefulWidget {
  final RegisterUserModel registerUserModel;
  const StepTwoScreen({Key? key, required this.registerUserModel})
      : super(key: key);

  @override
  State<StepTwoScreen> createState() => _StepTwoScreenState();
}

class _StepTwoScreenState extends State<StepTwoScreen> {
  late TextEditingController ulicaController, domController, kvartiraController;
  late RegisterUserModel _registerUserModel;

  @override
  void initState() {
    _registerUserModel = widget.registerUserModel;
    ulicaController = TextEditingController();
    domController = TextEditingController();
    kvartiraController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    ulicaController.dispose();
    domController.dispose();
    kvartiraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Styles.white),
        elevation: 1,
        backgroundColor: Styles.backgroundColor,
        title: Text(
          "Идентификация",
          style: TextStyle(fontSize: 16, color: Styles.textColor),
        ),
      ),
      backgroundColor: Styles.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            physics: ClampingScrollPhysics(),
            children: [
              SizedBox(height: 14),
              Text(
                "Шаг 2 из 4",
                style: TextStyle(color: Styles.textColor, fontSize: 24),
              ),
              SizedBox(height: 48),
              DropDown(
                items: ['Кыргызстан'],
                isExpanded: true,
                hint: Text(
                  'Страна',
                  style: Styles.ts16(
                    Styles.white.withOpacity(0.5),
                  ),
                ),
                onChanged: (value) {
                  _registerUserModel.strana = value.toString();
                },
              ),
              SizedBox(height: 16),
              DropDown(
                items: ['Чуйская'],
                isExpanded: true,
                hint: Text(
                  'Область',
                  style: Styles.ts16(
                    Styles.white.withOpacity(0.5),
                  ),
                ),
                onChanged: (value) {
                  _registerUserModel.oblast = value.toString();
                },
              ),
              SizedBox(height: 16),
              DropDown(
                items: ['Бишкек'],
                isExpanded: true,
                hint: Text(
                  'Город/Село',
                  style: Styles.ts16(
                    Styles.white.withOpacity(0.5),
                  ),
                ),
                onChanged: (value) {
                  _registerUserModel.gorod = value.toString();
                },
              ),
              SizedBox(height: 16),
              DropDown(
                items: ['Ленинский'],
                isExpanded: true,
                hint: Text(
                  'Район',
                  style: Styles.ts16(
                    Styles.white.withOpacity(0.5),
                  ),
                ),
                onChanged: (value) {
                  _registerUserModel.raion = value.toString();
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: CustomTextField(
                  label: 'Улица',
                  hasNext: true,
                  onChange: (text) {
                    setState(() {
                      _registerUserModel.ulica = text;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: CustomTextField(
                  onChange: (text) {
                    setState(() {
                      _registerUserModel.dom = text;
                    });
                  },
                  label: 'Дом',
                  hasNext: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: CustomTextField(
                  label: 'Квартира',
                  onChange: (text) {
                    setState(() {
                      _registerUserModel.kvartira = text;
                    });
                  },
                ),
              ),
              SizedBox(height: 32),
              CustomButton(
                text: "Далее",
                onPressed: () {
                  setState(() {});
                  if (_registerUserModel.strana == null ||
                      _registerUserModel.oblast == null ||
                      _registerUserModel.gorod == null ||
                      _registerUserModel.raion == null ||
                      _registerUserModel.ulica == null ||
                      _registerUserModel.dom == null ||
                      _registerUserModel.kvartira == null) {
                    FocusScope.of(context).unfocus();
                    AppToasts().showBottomToast(
                      'Пожалуйста заполните все поля',
                      context,
                      true,
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StepThreeScreen(
                          registerUserModel: _registerUserModel,
                        ),
                      ),
                    );
                  }
                },
                backgroundColor: Styles.backgroundColor2,
              ),
              SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
