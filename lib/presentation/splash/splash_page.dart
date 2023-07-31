import 'package:biatest/router/navigation_controller.dart';
import 'package:biatest/router/routes.dart';
import 'package:biatest/utils/app_mixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatelessWidget with ResponsiveMixin {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    initResponsive(context);

    return Builder(builder: (context) {
      Future.delayed(const Duration(seconds: 3)).then((value) {
        NavigationController.push(Routes.home.routeName, replace: true);
      });
      return Center(
        child: SizedBox(
          width: 124.w,
          height: 124.w,
          child: const Text("FLUTTER CLEAN ARCHITECTURE"),
        ),
      );
    });
  }
}
