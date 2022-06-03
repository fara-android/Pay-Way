import 'package:flutter/material.dart';
import 'package:wallet_ui/core/styles.dart';
import 'package:wallet_ui/features/presentation/screens/identification/step_three_screen.dart';
import 'package:wallet_ui/features/presentation/widgets/custom_button.dart';
import 'package:wallet_ui/features/presentation/widgets/custom_drop_down_button.dart';
import 'package:wallet_ui/features/presentation/widgets/custom_text_field.dart';

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
                "Шаг 2 из 4",
                style: TextStyle(color: Styles.textColor, fontSize: 24),
              ),
              SizedBox(height: 48),
              DropDown(
                items: ['sss', 'ads', 'asd'],
                isExpanded: true,
                hint: Text(
                  'Страна',
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
                  'Область',
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
                  'Город/Село',
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
                  'Район',
                  style: Styles.ts16(
                    Styles.white.withOpacity(0.5),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: CustomTextField(
                  label: 'Улица',
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: CustomTextField(
                  label: 'Дом',
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: CustomTextField(
                  label: 'Квартира',
                ),
              ),
              SizedBox(height: 32),
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
