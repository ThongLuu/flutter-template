import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:flutter_template/configs/app_typography.dart';
import 'package:flutter_template/configs/color_palatte.dart';

Future<void> showAppDialog(BuildContext context, String content,
    {Function? onCanceled,
    Function? onAccepted,
    String cancelText = "Suy nghĩ lại",
    String acceptText = "Tiếp tục"}) async {
  return Dialogs.materialDialog(
    context: context,
    title: content,
    barrierDismissible: false, // user must tap button!
    actions: <Widget>[
      Container(
          height: 60.h,
          decoration: BoxDecoration(
              gradient: Gradients.buttonYellowGradientBackground,
              borderRadius: BorderRadius.circular(7)),
          child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: ColorPalette.transparent,
                // Màu nền màu vàng
                foregroundColor: ColorPalette.textBlackColor, // Màu chữ
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(7.0), // Border radius here
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop("Cancel");
                if (onCanceled != null) {
                  onCanceled();
                }
              },
              child: Padding(
                padding: EdgeInsets.all(5),
                child: Text(
                  cancelText,
                  style: AppText.h3b!,
                ),
              ))),
      Container(
          height: 60.h,
          decoration: BoxDecoration(
              gradient: Gradients.buttonGrayGradientBackground,
              borderRadius: BorderRadius.circular(7)),
          child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: ColorPalette.transparent,
                // Màu nền màu vàng
                foregroundColor: ColorPalette.textBlackColor, // Màu chữ
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(7.0), // Border radius here
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop("Accept");
                if (onAccepted != null) {
                  onAccepted();
                }
              },
              child: Padding(
                padding: EdgeInsets.all(5),
                child: Text(
                  acceptText,
                  style: AppText.h3b!,
                ),
              ))),
    ],
  );
}
