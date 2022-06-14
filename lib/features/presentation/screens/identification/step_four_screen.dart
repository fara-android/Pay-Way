import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wallet_ui/core/styles.dart';
import 'package:wallet_ui/features/data/models/user/register_user_model.dart';
import 'package:wallet_ui/features/presentation/cubits/register_user/register_user_cubit/register_user_cubit.dart';
import 'package:wallet_ui/features/presentation/screens/identification/components/photo_container.dart';
import 'package:wallet_ui/features/presentation/screens/identification/register_success_screen.dart';
import 'package:wallet_ui/features/presentation/widgets/app_toasts.dart';
import 'package:wallet_ui/features/presentation/widgets/custom_button.dart';
import 'package:wallet_ui/features/presentation/widgets/scale_animated_container.dart';
import 'package:wallet_ui/service_locator.dart';

class StepFourScreen extends StatefulWidget {
  final RegisterUserModel registerUserModel;
  const StepFourScreen({Key? key, required this.registerUserModel})
      : super(key: key);

  @override
  _StepFourScreenState createState() => _StepFourScreenState();
}

class _StepFourScreenState extends State<StepFourScreen> {
  late RegisterUserModel _registerUserModel;
  final registerCubit = sl<RegisterUserCubit>();
  @override
  void initState() {
    _registerUserModel = widget.registerUserModel;
    super.initState();
  }

  XFile? front;
  XFile? back;
  XFile? selfie;
  final _picker = ImagePicker();
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 14),
              Text(
                "Шаг 4 из 4",
                style: TextStyle(color: Styles.textColor, fontSize: 24),
              ),
              SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PhotoContainer(
                    file: front,
                    hint: 'Фото паспорта с лицевой стороны',
                    onReset: () {
                      setState(() {
                        front = null;
                      });
                    },
                    onTap: () {
                      showModalSheet(
                        context,
                        onGalleryTap: () async {
                          final _image = await _picker.pickImage(
                              source: ImageSource.gallery);
                          setState(() {
                            front = _image;
                          });
                        },
                        onPhotoTap: () async {
                          final _image = await _picker.pickImage(
                              source: ImageSource.camera);
                          setState(() {
                            front = _image;
                          });
                        },
                      );
                    },
                  ),
                  PhotoContainer(
                    file: back,
                    hint: 'Фото паспорта с обратной стороны',
                    onReset: () {
                      setState(() {
                        back = null;
                      });
                    },
                    onTap: () {
                      showModalSheet(
                        context,
                        onGalleryTap: () async {
                          final _image = await _picker.pickImage(
                              source: ImageSource.gallery);
                          setState(() {
                            back = _image;
                          });
                        },
                        onPhotoTap: () async {
                          final _image = await _picker.pickImage(
                              source: ImageSource.camera);
                          setState(() {
                            back = _image;
                          });
                        },
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  PhotoContainer(
                    file: selfie,
                    hint: 'Сделайте селфи с паспортом',
                    onReset: () {
                      setState(() {
                        selfie = null;
                      });
                    },
                    onTap: () {
                      showModalSheet(
                        context,
                        onGalleryTap: () async {
                          final _image = await _picker.pickImage(
                              source: ImageSource.gallery);
                          setState(() {
                            selfie = _image;
                          });
                        },
                        onPhotoTap: () async {
                          final _image = await _picker.pickImage(
                            source: ImageSource.camera,
                            preferredCameraDevice: CameraDevice.front,
                          );
                          setState(() {
                            selfie = _image;
                          });
                        },
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 14),
              Spacer(),
              BlocProvider.value(
                value: registerCubit,
                child: BlocListener<RegisterUserCubit, RegisterUserState>(
                  listener: (context, state) {
                    state.maybeWhen(
                      orElse: () {},
                      failed: (e) {
                        AppToasts().showBottomToast(e, context, true);
                      },
                      loaded: (user) {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (_) => RegisterSuccessScreen()),
                            (route) => false);
                      },
                    );
                  },
                  child: CustomButton(
                    text: "Готово",
                    onPressed: () {
                      _registerUserModel.tipDokumenta = 'Паспорт';
                      _registerUserModel.nomerPasporta = '1';
                      _registerUserModel.dataVydaciPasporta = '1';
                      _registerUserModel.organVydaciPasporta = '1';
                      _registerUserModel.organVydaciPasporta = '1';
                      _registerUserModel.email = 'sss';
                      registerCubit.registerUser(_registerUserModel);
                    },
                    backgroundColor: Styles.backgroundColor2,
                  ),
                ),
              ),
              SizedBox(height: 30)
            ],
          ),
        ),
      ),
    );
  }

  showModalSheet(
    BuildContext context, {
    required Future<void> Function() onPhotoTap,
    required Future<void> Function() onGalleryTap,
  }) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return Container(
            decoration: BoxDecoration(color: Styles.backgroundColor),
            height: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 30),
                Text(
                  'Фото',
                  style: Styles.ts18(Styles.white, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ScaleAnimationContainer(
                      onPressed: () {
                        Navigator.pop(context);
                        onPhotoTap();
                      },
                      child: Container(
                        width: Styles.getWidth(context) / 2.4,
                        decoration: BoxDecoration(
                          color: Color(0xFF022635),
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                        child: Column(
                          children: [
                            Icon(
                              CupertinoIcons.camera,
                              color: Styles.white,
                              size: 32,
                            ),
                            SizedBox(height: 16),
                            Text(
                              'Фото',
                              textAlign: TextAlign.center,
                              style: Styles.ts16(Styles.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ScaleAnimationContainer(
                      onPressed: () {
                        Navigator.pop(context);
                        onGalleryTap();
                      },
                      child: Container(
                        width: Styles.getWidth(context) / 2.4,
                        decoration: BoxDecoration(
                          color: Color(0xFF022635),
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                        child: Column(
                          children: [
                            Icon(
                              Icons.photo_album,
                              color: Styles.white,
                              size: 32,
                            ),
                            SizedBox(height: 16),
                            Text(
                              'Галерея',
                              textAlign: TextAlign.center,
                              style: Styles.ts16(Styles.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }
}
