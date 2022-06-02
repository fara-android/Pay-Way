import 'package:flutter/material.dart';
import 'package:wallet_ui/core/styles.dart';
import 'package:wallet_ui/features/presentation/screens/identification/components/custom_text_field_step_one.dart';
import 'package:wallet_ui/features/presentation/screens/identification/step_two_screen.dart';
import 'package:wallet_ui/features/presentation/widgets/custom_button.dart';

class StepOneScreen extends StatelessWidget {
  const StepOneScreen({Key? key}) : super(key: key);

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
                "Пожалуйста пройдите\nидентификацию",
                style: TextStyle(color: Styles.textColor, fontSize: 24),
              ),
              SizedBox(height: 24),
              Text(
                "Для полноценного использования кошелька,\nвам необходимо пройти идентификацию",
                style: TextStyle(color: Styles.textColor, fontSize: 15),
              ),
              SizedBox(height: 32),
              CustomTextfieldStep(labelTextt: "Фамилия "),
              CustomTextfieldStep(labelTextt: "Имя"),
              CustomTextfieldStep(labelTextt: "Отчество"),
              CustomTextfieldStep(labelTextt: "Пол"),
              CustomTextfieldStep(labelTextt: "Семейный статус"),
              CustomTextfieldStep(labelTextt: "Дата рождения"),
              CustomTextfieldStep(labelTextt: "Номер телефона"),
              CustomTextfieldStep(labelTextt: "e-mail "),
              // Spacer(),
              SizedBox(height: 14),
              CustomButton(
                  text: "Далее",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StepTwoScreen(),
                      ),
                    );
                  },
                  backgroundColor: Styles.backgroundColor2),
                  SizedBox(height: 10),
              SizedBox(
                height: 18,
              )
            ],
          ),
        ),
      ),
    );
  }
}
