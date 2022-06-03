import 'package:flutter/material.dart';
import 'package:wallet_ui/core/styles.dart';
import 'package:wallet_ui/features/presentation/screens/identification/step_four_screen.dart';
import 'package:wallet_ui/features/presentation/widgets/custom_button.dart';
import 'package:wallet_ui/features/presentation/widgets/custom_date_time_picker.dart';
import 'package:wallet_ui/features/presentation/widgets/custom_drop_down_button.dart';
import 'package:wallet_ui/features/presentation/widgets/custom_text_field.dart';

class StepThreeScreen extends StatelessWidget {
  const StepThreeScreen({Key? key}) : super(key: key);

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
                hintText: 'Номер Телефона',
              ),
              DropDown(
                items: ['sss', 'ads', 'asd'],
                isExpanded: true,
                hint: Text(
                  'Пол',
                  style: Styles.ts16(
                    Styles.white.withOpacity(0.5),
                  ),
                ),
              ),
              SizedBox(height: 16),
              DropDown(
                items: ['sss', 'ads', 'asd'],
                isExpanded: true,
                hint: Text(
                  'Семейный статус',
                  style: Styles.ts16(
                    Styles.white.withOpacity(0.5),
                  ),
                ),
              ),
              SizedBox(height: 16),
              CustomDateTimePicker(
                title: 'Дата рождения',
                backgroundColor: Color(0xFF022635),
                onChose: (text) {},
              ),
              SizedBox(height: 32),
              CustomButton(
                  text: "Далее",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StepFourScreen(),
                      ),
                    );
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
