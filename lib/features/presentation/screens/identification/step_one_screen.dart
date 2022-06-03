import 'package:flutter/material.dart';
import 'package:wallet_ui/core/styles.dart';
import 'package:wallet_ui/features/presentation/screens/identification/step_two_screen.dart';
import 'package:wallet_ui/features/presentation/widgets/custom_button.dart';
import 'package:wallet_ui/features/presentation/widgets/custom_text_field.dart';

class StepOneScreen extends StatefulWidget {
  const StepOneScreen({Key? key}) : super(key: key);

  @override
  State<StepOneScreen> createState() => _StepOneScreenState();
}

class _StepOneScreenState extends State<StepOneScreen> {
  final passportType = ValueNotifier(0);
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
              CustomTextField(
                label: "Фамилия ",
                hasNext: true,
              ),
              SizedBox(height: 4),
              CustomTextField(
                label: "Имя ",
                hasNext: true,
              ),
              SizedBox(height: 4),
              CustomTextField(
                label: "Отчество ",
              ),
              SizedBox(height: 16),
              Text(
                'Тип паспорта',
                style: Styles.ts14(Styles.white.withOpacity(0.5)),
              ),
              SizedBox(height: 10),
              ValueListenableBuilder(
                valueListenable: passportType,
                builder: (context, _, __) {
                  return Container(
                    decoration: BoxDecoration(
                        color: Color(0xFF022635),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    padding: EdgeInsets.all(4),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: () {
                              passportType.value = 0;
                            },
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 32, vertical: 16),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: passportType.value == 0
                                    ? Styles.backgroundColor2
                                    : Colors.transparent,
                              ),
                              child: Text(
                                'Паспорт КР',
                                style: Styles.ts16(
                                  passportType.value == 0
                                      ? Styles.white
                                      : Color(0xFF033043),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: () => passportType.value = 1,
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(
                                horizontal: 32,
                                vertical: 16,
                              ),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                                color: passportType.value == 1
                                    ? Styles.backgroundColor2
                                    : Colors.transparent,
                              ),
                              child: Text(
                                'Ин. паспорт',
                                style: Styles.ts16(
                                  passportType.value == 1
                                      ? Styles.white
                                      : Color(0xFF033043),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(height: 16),
              ValueListenableBuilder(
                valueListenable: passportType,
                builder: (str, _, __) {
                  return passportType.value == 0
                      ? CustomTextField(
                          label: "ИНН ",
                          onSubmitted: (text) {},
                        )
                      : Text(
                          'Текст предложения идентификации в одном из филлиалов (Заменить)',
                          style: Styles.ts18(Styles.white),
                        );
                },
              ),
              SizedBox(height: 16),
              ValueListenableBuilder(
                  valueListenable: passportType,
                  builder: (context, _, __) {
                    return SizedBox(
                      child: passportType.value == 0
                          ? CustomButton(
                              text: "Далее",
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => StepTwoScreen(),
                                  ),
                                );
                              },
                              backgroundColor: Styles.backgroundColor2,
                            )
                          : CustomButton(
                              text: "Ближайшие филлиалы",
                              onPressed: () {},
                              backgroundColor: Styles.backgroundColor2,
                            ),
                    );
                  }),
              SizedBox(height: 30)
            ],
          ),
        ),
      ),
    );
  }
}
