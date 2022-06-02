import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallet_ui/core/styles.dart';
import 'package:wallet_ui/features/presentation/screens/identification/components/custom_text_field_step_one.dart';
import 'package:wallet_ui/features/presentation/widgets/custom_button.dart';

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
                "Шаг 3 из 3",
                style: TextStyle(color: Styles.textColor, fontSize: 24),
              ),
              SizedBox(height: 32),
              CustomTextfieldStep(labelTextt: "Номер паспорта"),
              CustomTextfieldStep(labelTextt: "Дата выдачи паспорта"),
              CustomTextfieldStep(labelTextt: "Орган выдачи паспорта"),
              CustomTextfieldStep(labelTextt: "Инн"),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: Styles.getWidth(context) / 2.4,
                    decoration: BoxDecoration(
                      color: Color(0xFF022635),
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                    child: Column(
                      children: [
                        Icon(
                          Icons.cloud_upload_outlined,
                          color: Styles.backgroundColor2,
                          size: 32,
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Фото паспорта с лицевой стороны',
                          textAlign: TextAlign.center,
                          style: Styles.ts16(Styles.white),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: Styles.getWidth(context) / 2.4,
                    decoration: BoxDecoration(
                      color: Color(0xFF022635),
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                    child: Column(
                      children: [
                        Icon(
                          Icons.cloud_upload_outlined,
                          color: Styles.backgroundColor2,
                          size: 32,
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Фото паспорта с обратной стороны',
                          textAlign: TextAlign.center,
                          style: Styles.ts16(Styles.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Container(
                    width: Styles.getWidth(context) / 2.4,
                    decoration: BoxDecoration(
                      color: Color(0xFF022635),
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                    child: Column(
                      children: [
                        Icon(
                          Icons.cloud_upload_outlined,
                          color: Styles.backgroundColor2,
                          size: 32,
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Сделайте селфи с паспортом',
                          textAlign: TextAlign.center,
                          style: Styles.ts16(Styles.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 14),
              CustomButton(
                  text: "Готово",
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => StepTwoScreen(),
                    //   ),
                    // );
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
