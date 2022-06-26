import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wallet_ui/core/styles.dart';
import 'package:wallet_ui/features/presentation/screens/authorization/login_phone/login_phone_screen.dart';
import 'package:wallet_ui/features/presentation/screens/identification/step_one_screen.dart';
import 'package:wallet_ui/features/presentation/screens/settings/components/custom_setting_container.dart';
import 'package:wallet_ui/features/presentation/screens/settings/components/kyc_status_widget.dart';
import 'package:wallet_ui/service_locator.dart';

class SettingsScreen extends StatefulWidget {
  SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final _kycStatus = sl<SharedPreferences>().getInt('kyc_status');
  final _kycText = sl<SharedPreferences>().getString('kyc_text');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Настройки'),
        backgroundColor: Styles.backgroundColor,
      ),
      backgroundColor: Styles.backgroundColor,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 32),
                    Text(
                      sl<SharedPreferences>().getString('phone') ?? '',
                      style: Styles.ts24(Styles.white),
                    ),
                    SizedBox(height: 12),
                    KycStatusWidget(
                      kycStatus: _kycStatus,
                    ),
                    SizedBox(height: 40),
                    CustomSettingContainer(
                      icon: Icon(
                        Icons.credit_card,
                        color: Styles.white,
                      ),
                      title: 'Мои карты',
                      onTap: () {},
                    ),
                    SizedBox(height: 16),
                    CustomSettingContainer(
                      icon: Icon(
                        Icons.qr_code,
                        color: Styles.white,
                      ),
                      title: 'Мой QR',
                      onTap: () {},
                    ),
                    if (_kycStatus != 1)
                      Column(
                        children: [
                          SizedBox(height: 16),
                          CustomSettingContainer(
                            icon: Icon(
                              Icons.person,
                              color: Styles.white,
                            ),
                            title: 'Идентификация пользователя',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => StepOneScreen(),
                                ),
                              );
                            },
                            attentionWidget: _kycStatus != null
                                ? InkWell(
                                    onTap: () {
                                      showModalBottomSheet(
                                        context: context,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        builder: (context) {
                                          return Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 16,
                                            ),
                                            height: 300,
                                            decoration: BoxDecoration(
                                              color: Styles.backgroundColor,
                                            ),
                                            child: Column(
                                              children: [
                                                SizedBox(height: 12),
                                                Center(
                                                  child: Text(
                                                    'Отклон',
                                                    style: Styles.ts18(
                                                      Styles.red,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: 32),
                                                Text(
                                                  _kycText!
                                                      .replaceAll('[', '')
                                                      .replaceAll(']', ''),
                                                  style:
                                                      Styles.ts18(Styles.white),
                                                )
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(12)),
                                        color: Styles.red,
                                      ),
                                      child: Icon(
                                        Icons.priority_high_outlined,
                                        color: Colors.white,
                                        size: 14,
                                      ),
                                    ),
                                  )
                                : null,
                          ),
                        ],
                      ),
                    SizedBox(height: 16),
                    CustomSettingContainer(
                      icon: Icon(
                        Icons.insert_drive_file_outlined,
                        color: Styles.white,
                      ),
                      title: 'Публичная оферта',
                      onTap: () {},
                    ),
                    SizedBox(height: 16),
                    CustomSettingContainer(
                      icon: Icon(
                        Icons.security_outlined,
                        color: Styles.white,
                      ),
                      title: 'Настройки и безопасность',
                      onTap: () {},
                    ),
                    SizedBox(height: 16),
                    CustomSettingContainer(
                      icon: Icon(
                        CupertinoIcons.question_circle,
                        color: Styles.white,
                      ),
                      title: 'Помощь',
                      onTap: () {},
                    ),
                    SizedBox(height: 16),
                    CustomSettingContainer(
                      icon: Icon(
                        Icons.logout,
                        color: Styles.white,
                      ),
                      title: 'Выйти',
                      iconContainerColor: Styles.red,
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Выйти"),
                            content: Text("Вы действительно хотите выйти?"),
                            actions: <Widget>[
                              FlatButton(
                                onPressed: () {
                                  final prefs = sl<SharedPreferences>();
                                  prefs.clear();
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            LoginPhoneScreen(),
                                      ),
                                      (route) => false);
                                },
                                child: Text("Дa"),
                              ),
                              FlatButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("Закрыть"),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 60),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
