import 'package:flutter/material.dart';
import 'package:wallet_ui/core/styles.dart';
import 'package:wallet_ui/features/presentation/screens/identification/components/custom_text_field_step_one.dart';
import 'package:wallet_ui/features/presentation/screens/identification/step_three_screen.dart';
import 'package:wallet_ui/features/presentation/widgets/custom_button.dart';

class StepTwoScreen extends StatelessWidget {
  const StepTwoScreen({Key? key}) : super(key: key);

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
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 14),
              Text(
                "Шаг 2 из 3",
                style: TextStyle(color: Styles.textColor, fontSize: 24),
              ),
              SizedBox(height: 32),
              CustomTextfieldStep(labelTextt: "Страна"),
              CustomTextfieldStep(labelTextt: "Область"),
              CustomTextfieldStep(labelTextt: "Город/село"),
              CustomTextfieldStep(labelTextt: "Район"),
              CustomTextfieldStep(labelTextt: "Улица"),
              CustomTextfieldStep(labelTextt: "Дом"),
              CustomTextfieldStep(labelTextt: "Квартира"),
              SizedBox(height: 48),
              CustomButton(
                  text: "Далее",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StepThreeScreen(),
                      ),
                    );
                  },
                  backgroundColor: Styles.backgroundColor2),
            ],
          ),
        ),
      ),
    );
  }
}
