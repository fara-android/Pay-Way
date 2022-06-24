import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wallet_ui/core/styles.dart';
import 'package:wallet_ui/features/data/models/user/register_user_model.dart';
import 'package:wallet_ui/features/presentation/screens/identification/step_four_screen.dart';
import 'package:wallet_ui/features/presentation/widgets/app_toasts.dart';
import 'package:wallet_ui/features/presentation/widgets/custom_button.dart';
import 'package:wallet_ui/features/presentation/widgets/custom_date_time_picker.dart';
import 'package:wallet_ui/features/presentation/widgets/custom_drop_down_button.dart';
import 'package:wallet_ui/features/presentation/widgets/custom_text_field.dart';
import 'package:wallet_ui/service_locator.dart';

class StepThreeScreen extends StatefulWidget {
  final RegisterUserModel registerUserModel;
  const StepThreeScreen({
    Key? key,
    required this.registerUserModel,
  }) : super(key: key);

  @override
  State<StepThreeScreen> createState() => _StepThreeScreenState();
}

class _StepThreeScreenState extends State<StepThreeScreen> {
  late RegisterUserModel _registerUserModel;
  @override
  void initState() {
    _registerUserModel = widget.registerUserModel;
    _registerUserModel.mobilnyiTelefon =
        sl<SharedPreferences>().getString('phone');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                "Шаг 3 из 4",
                style: TextStyle(color: Styles.textColor, fontSize: 24),
              ),
              SizedBox(height: 48),
              CustomTextField(
                enabled: false,
                label: _registerUserModel.mobilnyiTelefon,
              ),
              SizedBox(height: 12),
              CustomTextField(
                label: 'e-mail',
                onChange: (value) => _registerUserModel.email = value,
              ),
              SizedBox(height: 12),
              DropDown(
                items: ['Мужской', 'Женский'],
                isExpanded: true,
                onChanged: (value) {
                  _registerUserModel.pol = value.toString();
                },
                hint: Text(
                  'Пол',
                  style: Styles.ts16(
                    Styles.white.withOpacity(0.5),
                  ),
                ),
              ),
              SizedBox(height: 12),
              DropDown(
                items: ['Холост', ' В браке'],
                isExpanded: true,
                onChanged: (value) {
                  _registerUserModel.semeinoePolozenie = value.toString();
                },
                hint: Text(
                  'Семейный статус',
                  style: Styles.ts16(
                    Styles.white.withOpacity(0.5),
                  ),
                ),
              ),
              SizedBox(height: 24),
              CustomDateTimePicker(
                title: 'Дата рождения',
                backgroundColor: Color(0xFF022635),
                onChose: (date) {
                  _registerUserModel.dataRozdeniya =
                      '${date.day}-${date.month}-${date.year}';
                },
              ),
              SizedBox(height: 32),
              CustomButton(
                  text: "Далее",
                  onPressed: () {
                    if (_registerUserModel.dataRozdeniya == null ||
                        _registerUserModel.semeinoePolozenie == null ||
                        _registerUserModel.pol == null) {
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
                          builder: (context) => StepFourScreen(
                            registerUserModel: _registerUserModel,
                          ),
                        ),
                      );
                    }
                  },
                  backgroundColor: Styles.backgroundColor2),
              SizedBox(height: 30)
            ],
          ),
        ),
      ),
    );
  }
}
