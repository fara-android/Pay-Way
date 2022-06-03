import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wallet_ui/core/styles.dart';
import 'package:wallet_ui/features/presentation/widgets/scale_animated_container.dart';

class PhotoContainer extends StatelessWidget {
  final String hint;
  final XFile? file;
  final Function() onTap;
  final Function() onReset;
  const PhotoContainer({
    Key? key,
    required this.file,
    required this.hint,
    required this.onTap,
    required this.onReset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Styles.getWidth(context) / 2.4,
      height: Styles.getWidth(context) / 2.1,
      decoration: BoxDecoration(
        color: Color(0xFF022635),
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      child: file == null
          ? ScaleAnimationContainer(
              onPressed: onTap,
              child: Column(
                children: [
                  Icon(
                    Icons.cloud_upload_outlined,
                    color: Styles.backgroundColor2,
                    size: 32,
                  ),
                  SizedBox(height: 16),
                  Text(
                    hint,
                    textAlign: TextAlign.center,
                    style: Styles.ts16(Styles.white),
                  ),
                ],
              ),
            )
          : SizedBox(
              child: Center(
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                      child: Image.file(
                        File(file!.path),
                        fit: BoxFit.cover,
                        height: Styles.getWidth(context) / 2.1,
                        width: Styles.getWidth(context) / 2.4,
                      ),
                    ),
                    ScaleAnimationContainer(
                      onPressed: onReset,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        padding: EdgeInsets.all(1),
                        child: Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
