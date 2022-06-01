import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallet_ui/core/styles.dart';
import 'package:wallet_ui/features/presentation/screens/settings/components/custom_setting_container.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Настройки'),
        backgroundColor: Styles.backgroundColor,
      ),
      backgroundColor: Styles.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 32),
                Center(
                  child: CircleAvatar(
                    radius: 40,
                    child: Text(
                      'K',
                      style: Styles.ts32(Styles.white),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Калмырза Тынымсеитов',
                  style: Styles.ts24(Styles.white),
                ),
                SizedBox(height: 40),
                CustomSettingContainer(
                  icon: Icon(
                    Icons.credit_card,
                    color: Styles.white,
                  ),
                  title: 'Мои карты',
                ),
                SizedBox(height: 16),
                CustomSettingContainer(
                  icon: Icon(
                    Icons.qr_code,
                    color: Styles.white,
                  ),
                  title: 'Мой QR',
                ),
                SizedBox(height: 16),
                CustomSettingContainer(
                  icon: Icon(
                    Icons.person,
                    color: Styles.white,
                  ),
                  title: 'Идентификация пользователя',
                ),
                SizedBox(height: 16),
                CustomSettingContainer(
                  icon: Icon(
                    Icons.insert_drive_file_outlined,
                    color: Styles.white,
                  ),
                  title: 'Публичная оферта',
                ),
                SizedBox(height: 16),
                CustomSettingContainer(
                  icon: Icon(
                    Icons.security_outlined,
                    color: Styles.white,
                  ),
                  title: 'Настройки и безопасность',
                ),
                SizedBox(height: 16),
                CustomSettingContainer(
                  icon: Icon(
                    CupertinoIcons.question_circle,
                    color: Styles.white,
                  ),
                  title: 'Помощь',
                ),
                SizedBox(height: 16),
                CustomSettingContainer(
                  icon: Icon(
                    Icons.logout,
                    color: Styles.white,
                  ),
                  title: 'Выйти',
                  iconContainerColor: Styles.red,
                ),
                SizedBox(height: 60),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
