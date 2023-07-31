import 'package:biatest/utils/util.dart';
import 'package:flutter/material.dart';

class AppPrimaryButton extends StatelessWidget {
  const AppPrimaryButton(
      {Key? key, required this.onPressed, required this.title})
      : super(key: key);

  final VoidCallback onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        colorScheme: const ColorScheme.light(primary: AppColor.active),
      ),
      child: OutlinedButton(
          style: OutlinedButton.styleFrom(
              side: BorderSide(width: 1.sp, color: AppColor.active),
              padding: EdgeInsets.only(bottom: 1.5.h)),
          onPressed: onPressed,
          child: AppText.primaryButtonText(title, color: AppColor.active)),
    );
  }
}
